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
    var itemList: [ItemViewModel]
    
    ///This ia the body of the view
    var body: some View {
        VStack {
            Text("Checklist").bold()
        
            NavigationView {
                ItemListView(itemList: itemList)
            }
        }
    }
}

///Define a new struct
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(itemList: [
           ItemViewModel(item: Item(title: "Watermelon")),
           ItemViewModel(item: Item(title: "Peach")),
           ItemViewModel(item: Item(title: "Rockmelon")),
           ItemViewModel(item: Item(title: "Strawberry")),
           ItemViewModel(item: Item(title: "Apple")),
        
        ])
    }
}



