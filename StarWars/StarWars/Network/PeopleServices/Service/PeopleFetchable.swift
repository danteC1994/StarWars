//
//  PeopleFetchable.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Combine
import Foundation

protocol PeopleFetchable {
    func requestPeople(request: PeopleRequest) async -> Result<PeopleList, APIError>
}
