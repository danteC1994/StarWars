//
//  People.swift
//  StarWars
//
//  Created by dante canizo on 03/02/2024.
//

import Foundation

struct People: Decodable {
    let birthYear: String
    let eyeColor: String
    let films: [String]
    let gender: String
    let hairColor: String
    let height: String
    let homeworld: String
    let mass: String
    let name: String
    let skinColor: String
    let created: String
    let edited: String
    let species: [String]
    let starships: [String]
    let url: String
    let vehicles: [String]
}
