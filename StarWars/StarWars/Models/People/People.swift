//
//  People.swift
//  StarWars
//
//  Created by dante canizo on 03/02/2024.
//

import Foundation

struct People: Decodable, Identifiable, Equatable {
    var id: UUID {
        return UUID()
    }
    let birthYear: String?
    let eyeColor: String?
    let films: [String]
    let gender: String
    let hairColor: String?
    let height: String
    let homeworld: String
    let mass: String
    let name: String
    let skinColor: String?
    let created: String
    let edited: String?
    let species: [String]
    let starships: [String]
    let url: String
    let vehicles: [String]

    init(birthYear: String?, eyeColor: String?, films: [String], gender: String, hairColor: String?, height: String, homeworld: String, mass: String, name: String, skinColor: String?, created: String, edited: String?, species: [String], starships: [String], url: String, vehicles: [String]) {
        self.birthYear = birthYear
        self.eyeColor = eyeColor
        self.films = films
        self.gender = gender
        self.hairColor = hairColor
        self.height = height
        self.homeworld = homeworld
        self.mass = mass
        self.name = name
        self.skinColor = skinColor
        self.created = created
        self.edited = edited
        self.species = species
        self.starships = starships
        self.url = url
        self.vehicles = vehicles
    }

    init() {
            birthYear = nil
            eyeColor = nil
            films = []
            gender = ""
            hairColor = ""
            height = ""
            homeworld = ""
            mass = ""
            name = ""
            skinColor = ""
            created = ""
            edited = nil
            species = []
            starships = []
            url = ""
            vehicles = []
    }
}
