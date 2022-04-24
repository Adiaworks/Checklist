//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var itemViewModel: ItemViewModel
//    @ObservedObject var subitemListViewModel: SubitemListViewModel
    @Environment(\.editMode) var editMode
    
    var body: some View {
        /// Display the editing view of a checklist
        if editMode?.wrappedValue == .active {
            ItemDetailEditView(itemViewModel: itemViewModel)
        } else {
            SubitemListView(itemViewModel: itemViewModel)
        }
    }
}

///this preview for ItemDetailView
struct ItemDetailView_Previews: PreviewProvider {
    /// This is the previews
    static var previews: some View {
        ItemDetailView(itemViewModel: ItemViewModel(model: Item(title: "Test"), subitems: [Subitem(name: "Subitem", isTicked: false)]))
    }
}


