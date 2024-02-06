//
//  GenericDecoderTests.swift
//  StarWarsTests
//
//  Created by dante canizo on 06/02/2024.
//

@testable import StarWars
import Foundation
import XCTest

class GenericDecoderTests: XCTestCase {
    var sut: GenericDecoder!

    override func setUp() {
        sut = GenericDecoder()
    }

    func testDecodePeopleList() {
        do {
            let data = try XCTUnwrap(PeopleData.getPeopleData())
            let peopleResult = sut.decode(PeopleList.self, from: data)

            guard case let .success(people) = peopleResult else { throw APIError.decoding("Fail while decoding people data") }
            
            XCTAssertFalse(people.results.isEmpty)
            XCTAssertEqual(people.count, 82)
        } catch {
            XCTFail("\(error)")
        }
    }
}
