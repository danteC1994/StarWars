//
//  PeopleRequest.swift
//  StarWars
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation

struct PeopleRequest {
    let page: String?

    init(page: String? = nil) {
        self.page = page
    }

    func queryItems() -> [URLQueryItem] {
        guard let page else { return [] }
        return [URLQueryItem(name: "page", value: page)]
    }
}
