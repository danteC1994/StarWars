//
//  StarshipService.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

actor starshipRepository: StarshipDataManager {
    private let starshipService: StarshipFetchable

    private(set) var page: String = ""
    private(set) var starshipFetched = [Starship]()
    
    init(starshipService: StarshipFetchable) {
        self.starshipService = starshipService
    }
    
    func requestStarship() async -> Result<StarshipList, APIError> {
        let result = await starshipService.requestStarship(request: .init())
        return handleResponse(result: result)
    }
    
    func requestStarshipNextPage() async -> Result<StarshipList, APIError> {
        let result = await starshipService.requestStarship(request: StarshipRequest(page: page))
        return handleResponse(result: result)
    }

    private func handleResponse(result: Result<StarshipList, APIError>) -> Result<StarshipList, APIError> {
        switch result {
        case let .success(starshipList):
            if let next = starshipList.next {
                updateNext(nextPage: next)
            }
            
            starshipFetched += starshipList.results
            return .success(
                .init(
                    count: starshipList.count,
                    next: starshipList.next,
                    previous: starshipList.previous,
                    results: starshipFetched
                )
            )
            
        case let .failure(error):
            return .failure(error)
        }
    }

    private func updateNext(nextPage: String) {
        let queryItems = URLComponents(string: nextPage)?.queryItems
        if let newPage = queryItems.map({ $0.first{ $0.name == "page" }?.value }) {
            page = newPage ?? page
        }
    }
}
