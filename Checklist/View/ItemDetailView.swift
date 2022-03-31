//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 27/3/2022.
//

import SwiftUI

///Define a new struct for displaying item details
struct ItemDetailView: View {
    ///This is a ItemViewModel
    var item: ItemViewModel
    
    ///This is the boday of the view
    var body: some View {
        Text(item.itemTitle)
    }
}

///Define a new struct for previews
struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: ItemViewModel(item: Item(title: "Test")))
    }
}
