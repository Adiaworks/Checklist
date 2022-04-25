//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    /// Declare the variable as an ItemListViewModel
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    /// Declare the variable as a view
    var body: some View {
        /// Loop all the checklists in this App
        List {
            /// Display every checklist
            ForEach(itemListViewModel.itemViewModel) { itemViewModel in
                NavigationLink(destination: ItemDetailView(itemListViewModel: itemListViewModel, itemViewModel: itemViewModel).navigationBarItems(trailing: EditButton())) {
                    ItemRowView(viewModel: itemViewModel)
                }
            }///Delete a checklist
            .onDelete { itemNumbers in
                itemListViewModel.remove(atOffsets: itemNumbers)
                itemListViewModel.save()
            }/// Move the position of a checklist
            .onMove { (indexSet, index) in
                self.itemListViewModel.itemViewModel.move(fromOffsets: indexSet, toOffset: index)
                itemListViewModel.save()
            }
        }/// Edit button and plus button in the navigation bar
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                itemListViewModel.addElement()
                itemListViewModel.save()
            }
        }, label: {
            Image(systemName: "plus")
        }))        
    }
}

/// This is the preview for the ItemListMasterView
struct ItemListMasterView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListMasterView(
            itemListViewModel: ItemListViewModel(
                itemViewModel: [ItemViewModel(
                        model: Item(title: "Test"),
                        subitems: [Subitem(name: "Subitem", isTicked: false)])]))
    }
}
