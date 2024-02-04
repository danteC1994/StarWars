//
//  PeopleEndpoint.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Foundation

struct PeopleEndpoint: StarWarsEndpoint {
    var endpointPath = "/people"
    let queryItems = [URLQueryItem]()
}
