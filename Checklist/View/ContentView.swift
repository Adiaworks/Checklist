//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

struct ContentView: View {
    var item: ItemViewModel
    
    var body: some View {
        VStack {
            Text("checklist")
                .bold()
            Text(item.itemTitle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(item: ItemViewModel(item:
            Item(title: "Watermelon"))
        )
    }
}
