//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 27/3/2022.
//

import SwiftUI

struct ItemDetailView: View {
    var item: ItemViewModel
    
    var body: some View {
        Text(item.itemTitle)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: ItemViewModel(item: Item(title: "Test")))
    }
}
