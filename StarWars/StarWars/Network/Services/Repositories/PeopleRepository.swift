//
//  PeopleRepository.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Foundation

actor PeopleRepository {
    private let peopleService: PeopleFetchable

    private(set) var page: String = ""
    private(set) var peopleFetched = [People]()
    
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
