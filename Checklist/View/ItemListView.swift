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
            HStack {
                ///Display the item title
                Text(itemViewModel.item.title)
                Spacer()
                ///Check if the length of item title is less than six, display a checkmark
                if (itemViewModel.item.title.count < 6) {
                    Image(systemName: "checkmark")
                }
        }.navigationTitle("Checklist")
        }
    }
}

//Define a new struct for previews
struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        ItemListView(itemList: [
            ItemViewModel(item: Item(title: "Peaches")),
            ItemViewModel(item: Item(title: "Melon")),
            ItemViewModel(item: Item(title: "Apple")),
        ])
        }
    }
}
