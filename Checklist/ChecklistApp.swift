//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

@main
struct ChecklistApp: App {
    var viewModel = [ItemViewModel(
        item: Item(title: "Watermelon"))]
    
    var body: some Scene {
        WindowGroup {
            ContentView(itemList: viewModel)
        }
    }
}
