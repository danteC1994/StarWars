//
//  PeopleService.swift
//  StarWars
//
//  Created by dante canizo on 03/02/2024.
//

import Foundation

struct PeopleService<Session>: PeopleFetchable where Session: AsyncSession {
    let session: Session
    let decoder: StarWarsDecodable

    func requestPeople(request: PeopleRequest) async -> Result<PeopleList, APIError> {
        guard let url = PeopleEndpoint(queryItems: request.queryItems()).getUrlRequest()
        else {
            return .failure(.url("Could not create url"))
        }
        let peopleData: Data
        do {
            (peopleData, _) = try await session.data(from: url, delegate: nil)
        } catch {
            return .failure(APIError.network("\(error)"))
        }
        
        return decoder.decode(PeopleList.self, from: peopleData)
    }
}
