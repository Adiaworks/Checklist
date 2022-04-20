//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    var body: some View {
        List {
            ForEach(itemListViewModel.itemViewModel) { itemViewModel in
                NavigationLink(destination: ItemDetailView(itemViewModel: itemViewModel).navigationBarItems(trailing: EditButton())) {
                    ItemRowView(viewModel: itemViewModel)
                }
            }.onDelete { itemNumbers in
                itemListViewModel.remove(atOffsets: itemNumbers)
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                itemListViewModel.addElement()
            }
        }, label: {
            Image(systemName: "plus")
        }))        
    }
}

///// This is the preview for the ItemListMasterView
//struct ItemListMasterView_Previews: PreviewProvider {
////    static var itemListViewModel = ItemListViewModel([itemViewModel: ItemViewModel(model: Item(title: "Test"))])
//
//    static var previews: some View {
//        ItemListMasterView(itemListViewModel: ItemListViewModel([itemViewModel: ItemViewModel(model: Item(title: "Test"))]))
//    }
//}
