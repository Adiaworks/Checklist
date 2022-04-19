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

/// This is the preview for the ItemListMasterView
struct ItemListMasterView_Previews: PreviewProvider {
    @State static var viewModel = ItemListViewModel(itemViewModel: [ItemViewModel(model: Item(title: "Test", subitems: ["strawberry", "apple", "orange"]))])
    
    static var previews: some View {
        ItemListMasterView(viewModel: $viewModel)
    }
}
