//
//  StarshipEndpoint.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

struct StarshipEndpoint: StarWarsEndpoint {
    var endpointPath = "/starships"
    let queryItems: [URLQueryItem]

    init(queryItems: [URLQueryItem] = []) {
        self.queryItems = queryItems
    }
}
