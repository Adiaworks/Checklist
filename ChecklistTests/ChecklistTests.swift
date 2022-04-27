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



    /// Test the Subitem model
    func testSubitemName() throws {
        /// Declare this variable as a string
        let name = "Apple"
        
        /// Declare this variable as a Bool
        let isTicked = true
        
        /// Get the instance of the Subitem model
        let subitem = Subitem(name: name, isTicked: isTicked)
        
        /// Assert the subitem name equals to "Apple"
        XCTAssertEqual(subitem.name, name)
        
        /// Assert the subitem name equals to "Apple"
        XCTAssertEqual(subitem.isTicked, isTicked)
    }
 
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
