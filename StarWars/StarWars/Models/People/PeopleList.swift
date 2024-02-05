//
//  PeopleList.swift
//  StarWars
//
//  Created by dante canizo on 04/02/2024.
//

struct PeopleList: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [People]
}
