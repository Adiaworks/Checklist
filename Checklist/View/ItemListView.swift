//
//  ItemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 27/3/2022.
//

import SwiftUI

struct ItemListView: View {
    var itemList: [ItemViewModel]
    
    var body: some View {
        List(itemList) {
            ItemDetailView(item: $0)
        }
    }
}


struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(itemList: [])
    }
}
