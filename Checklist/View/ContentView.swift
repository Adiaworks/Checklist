//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    ///
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            ItemListMasterView(itemListViewModel: itemListViewModel)
                .navigationTitle("Checklists")
            }
        }
    }


/// Define a new struct
struct ContentView_Previews: PreviewProvider {
    /// This variable will be used in the preview
//    let itemViewModel: [ItemViewModel] = [ItemViewModel(model: Item(title: "Test"))]
    
    static var previews: some View {
        return ContentView(itemListViewModel: ItemListViewModel(itemViewModel: [ItemViewModel(model: Item(title: "Test"))]))
    }
}
