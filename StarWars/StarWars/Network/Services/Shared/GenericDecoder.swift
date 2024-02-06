//
//  GenericDecoder.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation


protocol StarWarsDecodable {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) -> Result<T, APIError>
}

class GenericDecoder: StarWarsDecodable {
    func decode<T: Decodable>(_ type: T.Type, from data: Data) -> Result<T, APIError> {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return .success(model)
        } catch {
            return .failure(APIError.decoding("\(error)"))
        }
    }
}
