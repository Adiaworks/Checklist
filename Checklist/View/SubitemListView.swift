//
//  SubitemListView.swift
//  Checklist
//
//  Created by Wen Lyu on 21/4/2022.
//

import SwiftUI

struct SubitemListView: View {
    /// This variable is the ItemViewModel used in this view
    @ObservedObject var itemViewModel: ItemViewModel
    
    var body: some View {
        List {
            /// Loop all subitems
            ForEach(itemViewModel.subitems.indices, id:\.self) { index in
                HStack {
                    /// Display subitems with checkmark
                    if itemViewModel.subitems[index].isTicked {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                        Spacer()
                        Image(systemName: "checkmark").foregroundColor(.blue)
                    } else {
                        /// Display subitems without checkmark
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                        Spacer()
                    }
                }.contentShape(Rectangle())
                .onTapGesture {
                    /// Change the value of isTicked
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
