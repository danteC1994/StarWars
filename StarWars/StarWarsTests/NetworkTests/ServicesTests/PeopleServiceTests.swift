//
//  PeopleServiceTests.swift
//  StarWarsTests
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation
import XCTest
@testable import StarWars

class PeopleServiceTests: XCTestCase {
    var sut: PeopleService<MockSession>!

    func testSuccessRequestPeople() async {
        sut = PeopleService(session: MockSessionSuccess())

        let result = await sut.requestPeople(request: .init(page: "3"))

        guard case .success = result else {
            XCTFail(
                "requesting people MockSessionSuccess must return a success data result"
            )
            return
        }
    }

    func testFailureRequestPeople() async {
        sut = PeopleService(session: MockSessionFailure())

        let result = await sut.requestPeople(request: .init(page: "3"))

        guard case .failure = result else {
            XCTFail(
                "requesting people MockSessionFailure must return a failure data result"
            )
            return
        }
    }
}
