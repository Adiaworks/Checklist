//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    @Binding var viewModel: ItemListViewModel
    @Environment(\.editMode) var editMode
    @State var title = ""
    
    var body: some View {
        List {
            ForEach($viewModel.itemViewModel, id: \.self) { itemViewModel in
                NavigationLink(destination: ItemDetailView(viewModel: itemViewModel).navigationBarItems(trailing: EditButton())) {
                    ItemRowView(viewModel: itemViewModel)
                }
            }.onDelete { itemNumbers in
                viewModel.remove(atOffsets: itemNumbers)
            }
            if editMode?.wrappedValue == .active {
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name", text: $title) {
                        viewModel.addElement()
                        title = ""
                    }
                }
            }
        }
    }
}

//struct ItemListMasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListMasterView(dates: [Date.now, Date.now])
//    }
//}
