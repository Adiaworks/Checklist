//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    @Binding var viewModel: ItemListViewModel
//    @Environment(\.editMode) var editMode
//    @State var title = ""
    
    var body: some View {
        List {
            ForEach($viewModel.itemViewModel, id: \.self) { itemViewModel in
                NavigationLink(destination: ItemDetailView(viewModel: itemViewModel).navigationBarItems(trailing: EditButton())) {
                    ItemRowView(viewModel: itemViewModel)
                }
            }.onDelete { itemNumbers in
                viewModel.remove(atOffsets: itemNumbers)
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                viewModel.addElement()
            }
        }, label: {
            Image(systemName: "plus")
        }))        
    }
}

//struct ItemListMasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListMasterView(dates: [Date.now, Date.now])
//    }
//}
