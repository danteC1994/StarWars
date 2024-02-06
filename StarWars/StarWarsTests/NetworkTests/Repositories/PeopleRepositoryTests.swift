//
//  PeopleRepositoryTests.swift
//  StarWarsTests
//
//  Created by dante canizo on 05/02/2024.
//

import Foundation
import XCTest
@testable import StarWars

class PeopleRepositoryTests: XCTestCase {
    var sut: PeopleRepository!

    func testRequestPeople() async {
        sut = PeopleRepository(peopleService: PeopleServiceSuccessMock())

        let results = await sut.requestPeople()
        guard case let .success(peopleList) = results else {
            XCTFail(
                "requesting people PeopleServiceSuccessMock must to return a success result"
            )
            return
        }
        let cachedResults = await sut.peopleFetched
        let page = await sut.page

        XCTAssertNotNil(results)
        XCTAssertEqual(peopleList.results, cachedResults)
        XCTAssertEqual(cachedResults.count, 10)
        XCTAssertEqual(page, "3")
    }

    func testRequestPeopleFailure() async {
        sut = PeopleRepository(peopleService: PeopleServiceErrorMock())

        let results = await sut.requestPeople()
        guard case let .failure(urlError) = results else {
            XCTFail(
                "requesting people PeopleServiceErrorMock must return a failure result"
            )
            return
        }

        let cachedResults = await sut.peopleFetched
        let page = await sut.page

        XCTAssertNotNil(results)
        XCTAssertTrue(cachedResults.isEmpty)
        XCTAssertEqual(page, "")
        XCTAssertEqual(urlError, .url("Error while fetching People"))
    }

    func testRequestPeopleNextPage() async {
        sut = PeopleRepository(peopleService: PeopleServiceSuccessMock())

        _ = await sut.requestPeople()
        let results = await sut.requestPeopleNextPage()
        guard case let .success(peopleList) = results else {
            XCTFail(
                "requesting people PeopleServiceSuccessMock must return a success result"
            )
            return
        }
        let cachedResults = await sut.peopleFetched
        let page = await sut.page

        XCTAssertNotNil(results)
        XCTAssertEqual(peopleList.results, cachedResults)
        XCTAssertEqual(cachedResults.count, 20)
        XCTAssertEqual(page, "3")
    }
}
