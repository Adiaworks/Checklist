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
        Text(itemList[0].itemTitle)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(itemList: [ItemViewModel(item:
            Item(title: "Watermelon"))]
        )
    }
}
