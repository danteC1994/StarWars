//
//  PeopleServiceMock.swift
//  StarWars
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation

struct PeopleServiceSuccessMock: PeopleFetchable {
    func requestPeople(request: PeopleRequest) async -> Result<PeopleList, APIError> {
        .success(PeopleModelMocks.getPeopleList())
    }
}

struct PeopleServiceErrorMock: PeopleFetchable {
    func requestPeople(request: PeopleRequest) async -> Result<PeopleList, APIError> {
        .failure(.url("Error while fetching People"))
    }
}
