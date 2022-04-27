//
//  SubitemModelTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 27/4/2022.
//

import XCTest
@testable import Checklist

class SubitemModelTests: XCTestCase {
    /// Initialise an instance of the Subitem model
    let subitem = Subitem(name: "Peach", isTicked: false)
    
    /// Declare this variable as a Bool
    let isTickedFalse = false
    
    /// Declare this variable as a Bool
    let isTickedTrue = true
    
    /// Declare this variable as a string
    let testWrongName = "Apple"
    
    /// Declare this variable as a string
    let testCorrectName = "Peach"

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test the name of Subitem model
    func testSubitemNameEqualsToCorrectString() throws {
        /// Assert the subitem name equals to "Peach"
        XCTAssertEqual(subitem.name, testCorrectName)
    }
    
    /// Test the name of Subitem model
    func testSubitemNameNotEqualsToWrongString() throws {
        /// Assert the subitem name equals to "Peach"
        XCTAssertNotEqual(subitem.name, testWrongName)
    }
    
    /// Assert the subitem isTicked equals to false
    func testSubitemIsTickedEqualsToFalse() throws {
        XCTAssertEqual(subitem.isTicked, isTickedFalse)
    }
    
    /// Assert the subitem isTicked not equals to true
    func testSubitemIsTickedNotEqualsToTrue() throws {
        XCTAssertEqual(subitem.isTicked, isTickedFalse)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
