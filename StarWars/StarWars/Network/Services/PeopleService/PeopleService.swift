//
//  PeopleService.swift
//  StarWars
//
//  Created by dante canizo on 03/02/2024.
//

import Foundation

protocol AsyncSession {
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: AsyncSession {}

struct PeopleService<T>: PeopleFetchable where T: AsyncSession {
    let session: T

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
        do {
            let people = try JSONDecoder().decode(PeopleList.self, from: peopleData)
            return .success(people)
        } catch {
            return .failure(APIError.decoding("\(error)"))
        }
    }
}
