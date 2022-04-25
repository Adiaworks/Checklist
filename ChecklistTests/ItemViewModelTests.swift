//
//  AddSubitemTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 25/4/2022.
//

import XCTest
@testable import Checklist

class ItemViewModelTests: XCTestCase {
    let subitemName = "Shoppinglist"
    let title = "Todo list"
    let indices = 0
    let subitem = Subitem(name: "Shoppinglist", isTicked: false)
    let itemViewModel = ItemViewModel(model: Item(title: "Checklist"), subitems: [Subitem(name: "Apple", isTicked: false)])

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test the function of addSubitems with one complete instance of Subitem
    func testAddSubitemsWithOneSubitem() throws {
        itemViewModel.addSubitems(subitem: subitem)
        XCTAssertEqual(itemViewModel.subitems[1].name, subitemName)
        XCTAssertEqual(itemViewModel.subitems[1].isTicked, false)
    }
    
    /// Test the function of editTitle with a string
    func testEditTitleWithOneString() throws {
        itemViewModel.editTitle(entry: title)
        XCTAssertEqual(itemViewModel.model.title, title)
    }
    
    /// Test the function of removeSubitem
//    func testRemoveSubitem() throws {
//        itemViewModel.removeSubitem(atOffsets: indices)
//        XCTAssertNil(itemViewModel.subitems)
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
