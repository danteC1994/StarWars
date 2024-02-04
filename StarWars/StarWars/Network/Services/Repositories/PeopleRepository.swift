//
//  PeopleRepository.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Foundation

struct PeopleRepository {

    private let peopleService: PeopleFetchable

    init(peopleService: PeopleFetchable) {
        self.peopleService = peopleService
    }

    func requestPeople() async -> People? {
        let result = await peopleService.requestPeople()
        switch result {
        case let .success(people):
            return people
        case let .failure(error):
            switch error {
            case .url(_):
                break
            case .network(_):
                break
            case .decoding(_):
                break
            }
            return nil
        }
    }
}
