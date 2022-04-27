//
//  ItemListViewModelTests.swift
//  ChecklistTests
//
//  Created by Wen Lyu on 27/4/2022.
//

import XCTest
@testable import Checklist

class ItemListViewModelTests: XCTestCase {
    /// Declare a variable as a string
    let title = "Checklist"
    
    /// Declare a variable as a string
    let testTitle = "Test"
    
    /// Declare a variable as a string
    let subitemName = "Apple"
    
    /// Declare a variable as a string
    let testSubitemName = "Subitem"
    
    /// Declare a variable as a Bool
    let subitemIsTicked = false
    
    /// Declare a variable as a Bool
    let subitemIsTickedTrue = true
    
    /// Declare a variable as an instance of ItemViewModel
    let testItemViewModel = ItemViewModel(
        model: Item(title: "Test"),
        subitems: [Subitem(name: "Pear", isTicked: true)]
    )
    
    /// Declare a variable as an array which consists of ItemViewModel
    let itemListViewModel = ItemListViewModel(itemViewModel: [ItemViewModel(
        model: Item(title: "Checklist"),
        subitems: [Subitem(name: "Apple", isTicked: false)]
    )])

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Test the function of addElement
    func testAddElement() throws {
        itemListViewModel.addElement()
        XCTAssertEqual(itemListViewModel.itemViewModel[1].model.title, title)
        XCTAssertEqual(itemListViewModel.itemViewModel[1].subitems[0].name, testSubitemName)
        XCTAssertEqual(itemListViewModel.itemViewModel[1].subitems[0].isTicked, subitemIsTicked)
    }
    
    /// Test the function of remove
    func testRemove() {
        print(itemListViewModel.itemViewModel.count)
        itemListViewModel.itemViewModel.remove(atOffsets: IndexSet([0]))
        itemListViewModel.itemViewModel.remove(atOffsets: IndexSet([0]))
        itemListViewModel.itemViewModel.remove(atOffsets: IndexSet([0]))
        XCTAssertTrue(itemListViewModel.itemViewModel.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
