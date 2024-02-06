//
//  StarshipDataManager.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

protocol StarshipDataManager {
    func requestStarship() async -> Result<StarshipList, APIError>
    func requestStarshipNextPage() async -> Result<StarshipList, APIError>
}
