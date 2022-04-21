//
//  SubitemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 21/4/2022.
//

import SwiftUI

struct SubitemListView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    
    var body: some View {
        List {
            ForEach(itemViewModel.subitems.indices, id:\.self) { index in
                HStack {
                    if itemViewModel.subitems[index].isTicked {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "checkmark").foregroundColor(.blue)
                    } else {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                        Spacer()
                    }
                }.contentShape(Rectangle())
                .onTapGesture {
                    itemViewModel.changeCheckmark(index: index)
                    itemViewModel.objectWillChange.send()
                }
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
