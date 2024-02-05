//
//  PeopleRepository.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Foundation

actor PeopleRepository {
    private var page: String = ""
    private let peopleService: PeopleFetchable
    private var peopleFetched = [People]()
    
    init(peopleService: PeopleFetchable) {
        self.peopleService = peopleService
    }
    
    func requestPeople() async -> Result<PeopleList, APIError> {
        let result = await peopleService.requestPeople(request: .init())
        return handleResponse(result: result)
    }
    
    func requestPeopleNextPage() async -> Result<PeopleList, APIError> {
        let result = await peopleService.requestPeople(request: PeopleRequest(page: page))
        return handleResponse(result: result)
    }

    private func handleResponse(result: Result<PeopleList, APIError>) -> Result<PeopleList, APIError> {
        switch result {
        case let .success(peopleList):
            if let next = peopleList.next {
                updateNext(nextPage: next)
            }
            
            peopleFetched += peopleList.results
            return .success(
                .init(
                    count: peopleList.count,
                    next: peopleList.next,
                    previous: peopleList.previous,
                    results: peopleFetched
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

struct PeopleRequest {
    let page: String?

    init(page: String? = nil) {
        self.page = page
    }

    func queryItems() -> [URLQueryItem] {
        guard let page else { return [] }
        return [URLQueryItem(name: "page", value: page)]
    }
}
