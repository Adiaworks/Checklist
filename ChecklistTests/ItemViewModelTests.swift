//
//  AddSubitemTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 25/4/2022.
//

import XCTest
@testable import Checklist

class ItemViewModelTests: XCTestCase {
    /// Declare a variable as a string
    let subitemCorrectName = "Peach"
    
    /// Declare a variable as a string
    let subitemWrongName = "Pear"
    
    /// Declare a variable as a string
    let subitemName = "Peach"
    
    /// Declare a variable as a string
    let title = "Checklist"
    
    /// Declare a variable as a string
    let testTitle = "Todo list"
    
    /// Declare a variable as an Int
    let indices = 0
    
    /// Declare a variable as a Bool
    let isTickedFalse = false
    
    /// Declare a variable as a Bool
    let isTickedTrue = true
    
    /// Declare a variable as an instance of Subitem
    let subitem = Subitem(name: "Peach", isTicked: false)
    
    /// Declare a variable as an array which consists of Subitem
    let testSubitems = [Subitem(name: "Apple", isTicked: false)]
    
    /// Declare a variable as an array which consists of Item and Subitem
    let itemViewModel = ItemViewModel(
        model: Item(title: "Checklist"),
        subitems: [Subitem(name: "Apple", isTicked: false)]
    )

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Test the title of ItemViewModel by a same string
    func testItemTitleByASameString() throws {
        ///Assert the item title equals to "Peach"
        XCTAssertEqual(itemViewModel.model.title, title)
    }
    
    /// Test the title of ItemViewModel by a different string
    func testItemTitleByADifferentString() throws {
        ///Assert the item title does not equal to "Apple"
        XCTAssertNotEqual(itemViewModel.model.title, testTitle)
    }

    /// Test the function of addSubitems with one completed instance of Subitem
    func testAddSubitemsWithOneSubitem() throws {
        itemViewModel.addSubitems(subitem: subitem)
        XCTAssertEqual(itemViewModel.subitems[1].name, subitemCorrectName)
        XCTAssertEqual(itemViewModel.subitems[1].isTicked, isTickedFalse)
    }
    
    /// Test the function of addSubitems with one completed instance of Subitem
    func testAddSubitemsWithOneSubitemNotEqualsToTheExample() throws {
        itemViewModel.addSubitems(subitem: subitem)
        XCTAssertNotEqual(itemViewModel.subitems[1].name, subitemWrongName)
        XCTAssertNotEqual(itemViewModel.subitems[1].isTicked, isTickedTrue)
    }
    
    /// Test the function of editTitle with a string
    func testEditTitleWithOneString() throws {
        itemViewModel.editTitle(entry: testTitle)
        XCTAssertEqual(itemViewModel.model.title, testTitle)
    }
    
    /// Test the function of removeSubitem with one completed instance of Subitem
    func testRemoveSubitemWithOneSubitem() throws {
        itemViewModel.removeSubitem(atOffsets: IndexSet([1]))
        XCTAssertEqual(testSubitems, itemViewModel.subitems )
    }
    
    /// Test the function of editSubitemName with one completed instance of Subitem
    func testEditSubitemName() throws {
        itemViewModel.editSubitemName(index: 0, entry: subitemName)
        XCTAssertEqual(itemViewModel.subitems[0].name, subitemName)
    }
    
    /// Test the function of changeCheckmark
    func testChangeCheckMark() throws {
        itemViewModel.changeCheckmark(index: 0)
        XCTAssertEqual(itemViewModel.subitems[0].isTicked, isTickedTrue)
    }
    
    /// Test the function of resetCheckmark
    func testResetCheckMark() throws {
        itemViewModel.changeCheckmark(index: 0)
        XCTAssertEqual(itemViewModel.subitems[0].isTicked, isTickedTrue)
        itemViewModel.resetCheckmark()
        XCTAssertEqual(itemViewModel.subitems[0].isTicked, isTickedFalse)
    }
    
    /// Test the function of saveOldCheckmark
    func testSaveOldCheckMark() throws {
        itemViewModel.saveOldCheckmark()
        XCTAssertEqual(itemViewModel.subitems[0].oldIsTicked, itemViewModel.subitems[0].isTicked)
    }
    
    /// Test the function of undoResetCheckmark
    func testUndoResetCheckMark() throws {
        itemViewModel.undoResetCheckmark()
        XCTAssertEqual(itemViewModel.subitems[0].isTicked, isTickedFalse)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
