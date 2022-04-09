//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    @Binding var viewModel: ItemListViewModel
    
    var body: some View {
        List {
            ForEach($viewModel.itemViewModel, id: \.self) { itemViewModel in
                NavigationLink(destination: ItemDetailView(model: itemViewModel.model)) {
                    Text("Follow me to the item details")
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
