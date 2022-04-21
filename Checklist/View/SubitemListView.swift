//
//  SubitemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 21/4/2022.
//

import SwiftUI

struct SubitemListView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    @State var isTicked = false
    
    var body: some View {
        List {
            ForEach(itemViewModel.subitems.indices, id:\.self) { index in
                HStack {
                    if isTicked {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                        Image(systemName: "checkmark").foregroundColor(.blue)
                    } else {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                    }
                }
                }.onTapGesture {
                    isTicked = !isTicked
            }
        }
        .navigationTitle(itemViewModel.model.title)
    }
}

struct SubitemListView_Previews: PreviewProvider {
    static var previews: some View {
        SubitemListView(itemViewModel: ItemViewModel(model: Item(title: "Test")))
    }
}
