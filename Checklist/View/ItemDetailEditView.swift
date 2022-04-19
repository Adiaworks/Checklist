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
            ForEach(0..<$viewModel.model.subitems.count) {
                index in
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name", text: $viewModel.model.subitems[index]) {
//                        viewModel.addSubitems(subitem: $viewModel.model.subitems[index])
                        title = ""
                    }
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
