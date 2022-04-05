//
//  ItemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 5/4/2022.
//

import SwiftUI

struct ItemListView: View {
    @Binding var itemLists: [ItemViewModel]
    
    var body: some View {
        List {
            ForEach(itemLists) { itemList in
                NavigationLink(destination: ItemTitleView(model: itemList)) {
                    Text("To details")
                }
            }
            .onDelete { itemNumbers in
                itemLists.remove(atOffsets: itemNumbers)
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                self.itemLists.append(ItemViewModel(item: Item(title: "Orange")))
            }
        }, label: {
            Image(systemName: "plus")
        }))
    }
}
