//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    
    ///This is an ItemViewModel
    @Binding var itemLists: [ItemViewModel]
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            ItemListView(itemLists: $itemLists)
                .navigationTitle("Checklist")
        }
    }
}


