//
//  ServiceMocks.swift
//  StarWarsTests
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation
@testable import StarWars

class MockSession: AsyncSession {
    func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        throw NSError(domain: "Avoid using this class, use subclasses instead", code: 0)
    }
}

class MockSessionSuccess: MockSession {
    override func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        (PeopleData.getPeopleData()!, .init())
    }
}

class MockSessionFailure: MockSession {
    override func data(from url: URL, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        (Data(), .init())
    }
}
