//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

struct ContentView: View {
    var itemList: [ItemViewModel]
    
    var body: some View {
        VStack {
            Text("Checklist").bold()
        
        List(itemList) { item in
            Text(item.itemTitle)
            .padding()
        }
        }
    }
}

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
