//
//  PeopleService.swift
//  StarWars
//
//  Created by dante canizo on 03/02/2024.
//

import Foundation

struct PeopleService: PeopleFetchable {
    func requestPeople(request: PeopleRequest) async -> Result<PeopleList, APIError> {
        guard let url = PeopleEndpoint(queryItems: request.queryItems()).getUrlRequest()
        else {
            return .failure(.url("Could not create url"))
        }
        let peopleData: Data
        do {
            (peopleData, _) = try await URLSession.shared.data(from: url)
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
