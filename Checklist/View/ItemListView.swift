//
//  ItemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 27/3/2022.
//

import SwiftUI

///Define a new struct for displaying the item list
struct ItemListView: View {
    ///This is an ItemViewModel
    var itemList: [ItemViewModel]
    
    ///The body of the view
    var body: some View {
        List(itemList) { itemViewModel in
            NavigationLink(itemViewModel.item.title){
                ItemDetailView(item: itemViewModel).navigationTitle("Detail View")
            }
        }.navigationTitle("Checklist")
    }
}

//Define a new struct for previews
struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ItemListView(itemList: [ItemViewModel(item: Item(title: "Peach"))])
        }
    }
}
