//
//  PeopleModelMocks.swift
//  StarWars
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation

class PeopleModelMocks {
    static func getPeopleList() -> PeopleList {
        .init(
            count: 2,
            next: "https://swapi.dev/api/people/?page=3",
            previous: "https://swapi.dev/api/people/?page=1",
            results: .init(repeating: getPeople("\(Int.random(in: 0..<20))"), count: 10) 
        )
    }

    static func getPeople(_ num: String = "") -> People {
    .init(
        birthYear: nil,
        eyeColor: nil,
        films: [],
        gender: "male",
        hairColor: "blond",
        height: "188",
        homeworld: "https://swapi.dev/api/planets/1/",
        mass: "84",
        name: "\(num)Anakin Skywalker",
        skinColor: "fair",
        created: "2014-12-10T16:20:44.310000Z",
        edited: nil,
        species: [],
        starships: [],
        url: "https://swapi.dev/api/people/11/",
        vehicles: []
    )
    }
}
