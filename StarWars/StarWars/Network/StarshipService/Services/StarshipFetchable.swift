//
//  StarshipFetchable.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

import Combine
import Foundation

protocol StarshipFetchable {
    func requestStarship(request: StarshipRequest) async -> Result<StarshipList, APIError>
}
