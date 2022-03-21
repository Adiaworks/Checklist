//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

struct ContentView: View {
    var checklist: String
    var checklistOne: String
    
    var body: some View {
        VStack {
            Text(checklist)
                .bold()
            Text(checklistOne)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            checklist: "Checklist",
            checklistOne: "Milk"
        )
    }
}
