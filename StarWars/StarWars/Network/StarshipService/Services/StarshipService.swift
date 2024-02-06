//
//  StarshipService.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

struct StarshipService<Session>: StarshipFetchable where Session: AsyncSession {
    let session: Session
    let decoder: StarWarsDecodable

    func requestStarship(request: StarshipRequest) async -> Result<StarshipList, APIError> {
        guard let url = StarshipEndpoint(queryItems: request.queryItems()).getUrlRequest()
        else {
            return .failure(.url("Could not create url"))
        }
        let peopleData: Data
        do {
            (peopleData, _) = try await session.data(from: url, delegate: nil)
        } catch {
            return .failure(APIError.network("\(error)"))
        }
        
        return decoder.decode(StarshipList.self, from: peopleData)
    }
}
