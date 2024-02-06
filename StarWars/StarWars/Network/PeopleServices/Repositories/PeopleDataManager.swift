//
//  PeopleDataManager.swift
//  StarWars
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation

protocol PeopleDataManager {
    func requestPeople() async -> Result<PeopleList, APIError>
    func requestPeopleNextPage() async -> Result<PeopleList, APIError>
}
