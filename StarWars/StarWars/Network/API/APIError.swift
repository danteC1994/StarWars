//
//  APIError.swift
//  StarWars
//
//  Created by dante canizo on 02/02/2024.
//

enum APIError: Error {
    case url(_ errorDescription: String)
    case network(_ errorDescription: String)
    case decoding(_ errorDescription: String)
}
