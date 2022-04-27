//
//  ChecklistApp.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI
@main

///Define a new struct for this App
struct ChecklistApp: App {
    /// This variable will be used in this App
    @StateObject var itemListViewModel = ItemListViewModel(itemViewModel: [ItemViewModel]())
    
    var body: some Scene {
        WindowGroup {
            /// This is the ContentView of this App
            ContentView(itemListViewModel: ItemListViewModel(itemViewModel: [ItemViewModel]()))
        }
    }
}
