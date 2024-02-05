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

    func requestPeople() async -> Result<PeopleList, APIError> {
        let result = await peopleService.requestPeople()
        return result
    }
}
