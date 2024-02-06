//
//  Starship.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

struct Starship: Decodable, Identifiable, Equatable {
    var id: UUID {
        return UUID()
    }
    let name: String?
    let model: String?
    let passengers: String
    let length: String?
    let manufacturer: String?
    let crew: String?
}

