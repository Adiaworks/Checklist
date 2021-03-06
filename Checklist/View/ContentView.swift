//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    /// This variable will be used in this ContentView
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            ItemListMasterView(itemListViewModel: itemListViewModel)
                .navigationTitle("Checklists")
            }
        }
    }

/// This is the preview    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView(itemListViewModel: ItemListViewModel(itemViewModel: [ItemViewModel(model: Item(title: "Test"), subitems: [Subitem(name: "Subitem", isTicked: false)])]))
    }
}
