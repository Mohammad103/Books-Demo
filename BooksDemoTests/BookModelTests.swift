//
//  BookModelTests.swift
//  BooksDemoTests
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import XCTest
@testable import BooksDemo

class BookModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuthorsDescription() {
        var book = Book()
        book.authors.append(Author(name: "Author1"))
        book.authors.append(Author(name: "Author2"))
        book.authors.append(Author(name: "Author3"))
        XCTAssertEqual(book.authorsDescription(), "By: Author1, Author2, Author3")
        
        book = Book()
        book.authors.append(Author(name: "Author1"))
        book.authors.append(Author(name: nil))
        book.authors.append(Author(name: "Author3"))
        XCTAssertEqual(book.authorsDescription(), "By: Author1, Author3")
        
        book = Book()
        XCTAssertEqual(book.authorsDescription(), "")
    }
    
    func testNarratorsDescription() {
        var book = Book()
        book.narrators.append(Narrator(name: "Narrator1"))
        book.narrators.append(Narrator(name: "Narrator2"))
        book.narrators.append(Narrator(name: "Narrator3"))
        XCTAssertEqual(book.narratorsDescription(), "With: Narrator1, Narrator2, Narrator3")
        
        book = Book()
        book.narrators.append(Narrator(name: "Narrator1"))
        book.narrators.append(Narrator(name: nil))
        book.narrators.append(Narrator(name: "Narrator3"))
        XCTAssertEqual(book.narratorsDescription(), "With: Narrator1, Narrator3")
        
        book = Book()
        XCTAssertEqual(book.narratorsDescription(), "")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
