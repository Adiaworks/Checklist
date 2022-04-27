//
//  ItemModelTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 27/4/2022.
//

import XCTest
@testable import Checklist

class ItemModelTests: XCTestCase {
    /// Initialise an instance of the Item model
    let item = Item(title:"Peach")
    let title = "Peach"
    let testTitle = "Apple"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test the title of Item model by a same string
    func testItemTitleByASameString() throws {
        ///Assert the item title equals to "Peach"
        XCTAssertEqual(item.title, title)
    }
    
    /// Test the title of Item model by a different string
    func testItemTitleByADifferentString() throws {
        ///Assert the item title does not equal to "Apple"
        XCTAssertNotEqual(item.title, testTitle)
    }
    
    /// Test the title of Item model is not nil
    func testItemTitleNotNil() throws {
        ///Assert the item title is not nil
        XCTAssertNotNil(item.title)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
