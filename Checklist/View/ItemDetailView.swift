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
                ForEach(itemViewModel.subitems.indices, id:\.self) { index in
                    HStack {
                        Text(itemViewModel.subitems[index].name).foregroundColor(.blue)
                            .onTapGesture {
                                if itemViewModel.subitems[index].isTicked == false {
                                    itemViewModel.subitems[index].isTicked = true
                                    Image(systemName: "checkmark")
                                } else {
                                    itemViewModel.subitems[index].isTicked = false
                                }
                            }
//                        Button(action: {
//                            itemViewModel.subitems[index].toggle()
//                        }) {
//                            if itemViewModel.subitems[index].isTicked == false {
//                                itemViewModel.subitems[index].isTicked = true
//                                Image(systemName: "checkmark")
//                            } else {
//                                itemViewModel.subitems[index].isTicked = false
//                            }
//
//                        }
//                        SubitemTickedView(itemViewModel.subitems[index].isTicked)
//                             .padding(.all, 3)
                    }
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
