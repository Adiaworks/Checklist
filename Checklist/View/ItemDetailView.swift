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
    @State var title = ""
    
    var body: some View {
        List {
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "note.text")
                    TextField("\(viewModel.model.title)", text: $viewModel.model.title) {
                        viewModel.editTitle(entry: viewModel.model.title)
                            title = ""
                    }
                }
                ItemDetailEditView(viewModel: $viewModel)
                    .navigationBarItems(leading: Button(action: {
                    print("Cool")//need a reset func here
                }, label: {
                    Text("Reset").foregroundColor(.red)
                    .frame(minWidth: 150, alignment: .trailing)
                }))
            } else {
                Text(viewModel.itemTitle)
            }
        }



//        NavigationView {
//        }
//        .navigationTitle(viewModel.itemTitle)
//        if editMode?.wrappedValue == .active {
//            HStack {
//                Image(systemName: "plus.circle").foregroundColor(.green)
//                TextField("Enter new entry name:", text: $title) {
//                    viewModel.editTitle(newTitle: title)
//                    title = ""
//                }
//            }
//        }
    }
}

///this preview needs to be fixed
//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(itemViewModel: Date.now)
//    }
//}


