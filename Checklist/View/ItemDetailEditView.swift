//
//  ItemDetailEditView.swift
//  Checklist
//
//  Created by Wen Lyu on 19/4/2022.
//

import SwiftUI

struct ItemDetailEditView: View {
    @Binding var viewModel: ItemViewModel
    @State var title = ""
    
    var body: some View {
        List {
            /// Loop all subitems of a checklist
            ForEach(0..<$viewModel.model.subitems.count) {
                index in
                HStack {
                    TextField("Enter new entry name", text: $viewModel.model.subitems[index])
                }
            }.onDelete {itemNumbers in
                viewModel.removeSubitem(atOffsets: itemNumbers)
            }
            HStack {
                Image(systemName: "plus.circle").foregroundColor(.green)
                TextField("Enter new entry name:", text: $title) {
                    viewModel.addSubitems(subitem: title)
                        title = ""
                }
            }
        }
    }
}

struct ItemDetailEditView_Previews: PreviewProvider {
    @State static var viewModel = ItemViewModel(model: Item(title: "Test", subitems: ["strawberry", "apple", "orange"]))
    
    static var previews: some View {
        ItemDetailEditView(viewModel: $viewModel)
    }
}
