//
//  ChecklistTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 20/3/2022.
//

import XCTest
@testable import Checklist

class ChecklistTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testItemTitle() throws {
        let item = Item(title:"Peach")
        XCTAssertEqual(item.title, "Peach")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
