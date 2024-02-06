//
//  StarshipList.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

struct StarshipList: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Starship]
}
