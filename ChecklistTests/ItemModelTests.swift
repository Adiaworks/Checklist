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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test the title of Item model by a string
    func testItemTitleByString() throws {
        ///Assert the item title equals to "Peach"
        XCTAssertEqual(item.title, "Peach")
    }
    
    /// Test the title of Item model by an Int
    func testItemTitleByInt() throws {
        ///Assert the item title equals to "Peach"
        XCTAssertEqual(item.title, "Peach")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
