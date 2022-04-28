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
    let testItemListViewModel = ItemListViewModel(itemViewModel: [ItemViewModel(
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
        testItemListViewModel.addElement()
        XCTAssertEqual(testItemListViewModel.itemViewModel[testItemListViewModel.itemViewModel.count - 1].model.title, title)
        XCTAssertEqual(testItemListViewModel.itemViewModel[testItemListViewModel.itemViewModel.count - 1].subitems[0].name, testSubitemName)
        XCTAssertEqual(testItemListViewModel.itemViewModel[testItemListViewModel.itemViewModel.count - 1].subitems[0].isTicked, subitemIsTicked)
    }
    
    /// Test the function of remove
    func testRemove() {
        let total = testItemListViewModel.itemViewModel.count
        testItemListViewModel.itemViewModel.remove(atOffsets: IndexSet([0]))
        XCTAssertEqual(testItemListViewModel.itemViewModel.count, total-1)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    /// Test the JSON
    func testJSON() {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(testItemListViewModel)
        XCTAssertNotNil(data)
        guard let data = data else {XCTFail() ; return}
        guard let jsonString = String(data: data, encoding: .utf8) else {XCTFail() ; return }
        XCTAssertEqual(jsonString, "{\"itemViewModel\":[{\"model\":{\"title\":\"Checklist\"},\"subitems\":[{\"name\":\"Subitem\",\"isTicked\":true,\"oldIsTicked\":false}]},{\"model\":{\"title\":\"Checklist\"},\"subitems\":[{\"name\":\"Subitem\",\"isTicked\":false,\"oldIsTicked\":false}]}]}")
    }
}
