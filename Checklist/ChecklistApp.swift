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
    @ObservedObject var itemListViewModel = ItemListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ///Add a $ sign so define a getter and setter for the viewModel which is binded in the contentview
            ContentView(itemListViewModel: ItemListViewModel())
        }
    }
}
