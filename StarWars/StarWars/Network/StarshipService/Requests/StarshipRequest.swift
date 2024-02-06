//
//  StarshipRequests.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

struct StarshipRequest {
    let page: String?

    init(page: String? = nil) {
        self.page = page
    }

    func queryItems() -> [URLQueryItem] {
        guard let page else { return [] }
        return [URLQueryItem(name: "page", value: page)]
    }
}
