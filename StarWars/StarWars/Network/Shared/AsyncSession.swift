//
//  AsyncSession.swift
//  StarWars
//
//  Created by dante canizo on 06/02/2024.
//

import Foundation

protocol AsyncSession {
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}
