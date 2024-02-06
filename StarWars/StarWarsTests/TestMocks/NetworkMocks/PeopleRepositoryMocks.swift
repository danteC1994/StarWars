//
//  PeopleRepositoryMocks.swift
//  StarWarsTests
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation
@testable import StarWars

class RepositoryMock: PeopleDataManager {
    var requestPeopleExecuted: Bool?
    var requestPeopleNextPageExecuted: Bool?
    func requestPeople() async -> Result<StarWars.PeopleList, StarWars.APIError> {
        requestPeopleExecuted = true
        return .success(PeopleModelMocks.getPeopleList())
    }
    
    func requestPeopleNextPage() async -> Result<StarWars.PeopleList, StarWars.APIError> {
        requestPeopleNextPageExecuted = true
        return .success(PeopleModelMocks.getPeopleList())
    }
}
