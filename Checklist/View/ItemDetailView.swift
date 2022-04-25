//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    /// Declare the variable as an ItemListViewModel
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    /// Declare the variable as an ItemViewModel
    @ObservedObject var itemViewModel: ItemViewModel
    
    /// This  variable represents the mode of the present environment
    @Environment(\.editMode) var editMode
    
    /// Declare the variable as a view
    var body: some View {
        /// Display the editing view of a checklist
        if editMode?.wrappedValue == .active {
            ItemDetailEditView(itemListViewModel: itemListViewModel, itemViewModel: itemViewModel)
        } else {
            /// Display a checklist without editing mode
            SubitemListView(itemListViewModel: itemListViewModel, itemViewModel: itemViewModel)
        }
    }
}

///This preview is for ItemDetailView
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(
            itemListViewModel: ItemListViewModel(
                itemViewModel: [ItemViewModel(
                    model: Item(title: "Test"),
                    subitems: [Subitem(name: "Subitem", isTicked: false)])]),
            itemViewModel: ItemViewModel(
                model: Item(title: "Test"),
                subitems: [Subitem(name: "Subitem", isTicked: false)]))
    }
}


