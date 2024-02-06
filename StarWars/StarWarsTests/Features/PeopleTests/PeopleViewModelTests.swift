//
//  PeopleViewModelTests.swift
//  StarWarsTests
//
//  Created by dante canizo on 05/02/2024.
//

import Combine
import XCTest
@testable import StarWars

class PeopleViewModelTests: XCTestCase {
    var sut: PeopleListViewModel!
    var peopleRepository = RepositoryMock()
    var cancellables = Set<AnyCancellable>()

    override func setUp() {
        sut = PeopleListViewModel(peopleRepository: peopleRepository)
    }

    func testGetPeople_withEmptyPeopleArray() async {
        await sut.getPeople()

        XCTAssertTrue(try XCTUnwrap(peopleRepository.requestPeopleExecuted))
        XCTAssertEqual(sut.people.count, 10)
    }

    func testGetPeople_withNonEmptyPeopleListArray() async {
        sut.people = PeopleModelMocks.getPeopleList().results

        await sut.getPeople()

        XCTAssertTrue(try XCTUnwrap(peopleRepository.requestPeopleNextPageExecuted))
        XCTAssertEqual(sut.people.count, 20)
    }

    
    func testGetPeople_setLoadingValue() async {
        let expectation = expectation(description: "")
        sut.$isPeopleLoading.sink { loading in
            if loading {
                expectation.fulfill()
            }
        }.store(in: &cancellables)

        await sut.getPeople()

        wait(for: [expectation], timeout: 2)
    }
}
