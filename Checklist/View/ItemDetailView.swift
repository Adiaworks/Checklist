//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var viewModel: ItemViewModel
    @Environment(\.editMode) var editMode
    
    var body: some View {
        /// Display the editing view of a checklist
        if editMode?.wrappedValue == .active {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "note.text")
                    TextField("Enter a new entry", text: $viewModel.model.title) {
                        viewModel.editTitle(entry: viewModel.model.title)
                    }.font(.largeTitle)
                }
                ItemDetailEditView(viewModel: $viewModel)
//                    .navigationBarItems(leading: Button(action: {
//                    print("Cool")//need a reset func here
//                }, label: {
//                    Text("Reset").foregroundColor(.red)
//                    .frame(minWidth: 150, alignment: .trailing)
//                }))
            }
        } else {
            List {
                ForEach(viewModel.model.subitems, id: \.self) { subitem in
                    Text(subitem).foregroundColor(.blue)
                }
            }
            .navigationTitle(viewModel.itemTitle)
        }
    }
}

///this preview needs to be fixed
struct ItemDetailView_Previews: PreviewProvider {
    @State static var viewModel = ItemViewModel(model: Item(title: "Test", subitems: ["strawberry", "apple", "orange"]))
    static var previews: some View {
        ItemDetailView(viewModel: $viewModel)
    }
}
