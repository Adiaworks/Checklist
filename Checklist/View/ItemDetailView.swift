//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @ObservedObject var itemViewModel: ItemViewModel
//    @ObservedObject var subitemListViewModel: SubitemListViewModel
    @Environment(\.editMode) var editMode
    
    var body: some View {
        /// Display the editing view of a checklist
        if editMode?.wrappedValue == .active {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "note.text")
                    TextField("Enter a new entry", text: $itemViewModel.model.title) {
                        itemViewModel.editTitle(entry: itemViewModel.model.title)
                    }.font(.largeTitle)
                }
                ItemDetailEditView(itemViewModel: itemViewModel)
//                    .navigationBarItems(leading: Button(action: {
//                    print("Cool")//need a reset func here
//                }, label: {
//                    Text("Reset").foregroundColor(.red)
//                    .frame(minWidth: 150, alignment: .trailing)
//                }))
            }
        } else {
            List {
                ForEach(itemViewModel.subitems) { subitem in
                    Text(subitem.name).foregroundColor(.blue)
                }
            }
            .navigationTitle(itemViewModel.model.title)
        }
    }
}

///this preview for ItemDetailView
struct ItemDetailView_Previews: PreviewProvider {
    /// Declare this variable as an ItemViewModel
//    var itemViewModel = ItemViewModel(model: Item(title: "Test"))
    /// Declare this variable as an SubitemViewModel
//    var subitemListViewModel = SubitemListViewModel([subitemViewModel: SubitemViewModel(model: Subitem(name: "Sugar", isTicked: false))])
    
    /// This is the previews
    static var previews: some View {
        ItemDetailView(itemViewModel: ItemViewModel(model: Item(title: "Test")))
    }
}
