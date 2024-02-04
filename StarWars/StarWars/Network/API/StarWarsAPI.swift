//
//  StarWarsAPI.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

import Foundation

protocol StarWarsAPI {
    var scheme: String { get }
    var host: String { get }
    var basePath: String { get }
}

extension StarWarsAPI {
    var scheme: String { "https" }
    var host: String { "swapi.dev" }
    var basePath: String { "/api" }
}

protocol StarWarsEndpoint: StarWarsAPI {
    var endpointPath: String { get }
    var queryItems: [URLQueryItem] { get }

    func getUrlRequest() -> URL?
}

extension StarWarsEndpoint {
    func getEndpointUrlComponents() -> URLComponents {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = basePath + endpointPath
        return components
    }

    func getUrlRequest() -> URL? {
        var endpointUrlComponents = getEndpointUrlComponents()
        endpointUrlComponents.queryItems = queryItems
        
        return endpointUrlComponents.url
    }
}

struct peopleEndpoint: StarWarsEndpoint {
    var endpointPath = "/people"
    let queryItems: [URLQueryItem]
}
