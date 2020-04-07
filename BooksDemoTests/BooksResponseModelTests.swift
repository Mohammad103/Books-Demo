//
//  BooksResponseModelTests.swift
//  BooksDemoTests
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import BooksDemo

class BooksResponseModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBooksResponse() throws {
        guard let path = Bundle(for: type(of: self)).path(forResource: "books-sample", ofType: "json") else {
            fatalError("Can't find search.json file")
        }

        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let response = try JSONDecoder().decode(BooksResponse.self, from: data)

        XCTAssertEqual(response.nextPageToken, "OC44NDA2Mzd%2bfjI1MzM0OX5%2bMTA%3d")
        XCTAssertEqual(response.books.count, 10)
        XCTAssertEqual(response.books[0].title, "Harry")
        XCTAssertEqual(response.books[0].authors.count, 1)
        XCTAssertEqual(response.books[0].authors[0].name, "Tim Wohlforth")
        XCTAssertEqual(response.books[0].narrators.count, 1)
        XCTAssertEqual(response.books[0].narrators[0].name, "Joe Barrett")
        XCTAssertEqual(response.books[0].cover?.url, "https://www.storytel.se/images/9781482956436/640x640/cover.jpg")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
