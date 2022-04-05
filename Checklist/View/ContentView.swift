//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    
    ///This is an ItemViewModel
    @Binding var itemLists: [ItemViewModel]
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            List {
                ForEach(itemLists) { itemList in
                    Text("\(itemList.itemTitle)")
                }
                .onDelete { itemNumbers in
                    itemLists.remove(atOffsets: itemNumbers)
                }
            }
            .navigationTitle("Checklist")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    withAnimation {
                        self.itemLists.append(ItemViewModel(item: Item(title: "Orange")))
                    }
            }, label: {
                Image(systemName: "plus")
            }
                                                                       ))
        }
    }
}





