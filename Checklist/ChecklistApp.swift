//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

@main
struct ChecklistApp: App {
    var viewModel = [
        ItemViewModel(item: Item(title: "Watermelon")),
        ItemViewModel(item: Item(title: "Peach")),
        ItemViewModel(item: Item(title: "Rockmelon")),
        ItemViewModel(item: Item(title: "Strawberry")),
        ItemViewModel(item: Item(title: "Apple")),
    ]
    
    var body: some Scene {
        WindowGroup {
            ContentView(itemList: viewModel)
        }
    }
}
