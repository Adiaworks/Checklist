//
//  ItemDetailEditView.swift
//  Checklist
//
//  Created by Wen Lyu on 19/4/2022.
//

import SwiftUI

struct ItemDetailEditView: View {
    /// This variable is the ItemListViewModel used in this view
    @ObservedObject var itemListViewModel: ItemListViewModel
    
    /// This variable is the ItemViewModel used in this view
    @ObservedObject var itemViewModel: ItemViewModel
    
    /// Delcare this variable's value as false
    @State private var showUndo = false
    
    /// This variable is used in TextField
    @State var title = ""
    
    /// Declare the variable as a view
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                /// Display individual checklist title with notebook icon
                Image(systemName: "note.text")
                TextField("Enter a new entry", text: $itemViewModel.model.title) {
                    itemViewModel.editTitle(entry: itemViewModel.model.title)
                    itemListViewModel.save()
                }.font(.largeTitle)
            }
            List {
                /// Loop all subitems of a checklist
                ForEach(itemViewModel.subitems.indices, id:\.self) {
                    index in
                    HStack {
                        /// Display subitems with checkmark
                        if itemViewModel.subitems[index].isTicked {
                            TextField("Enter new entry name", text: $itemViewModel.subitems[index].name) {
                                itemViewModel.editSubitemName(index: index, entry: itemViewModel.subitems[index].name)
                                itemListViewModel.save()
                            }
                            Spacer()
                            Image(systemName: "checkmark").foregroundColor(.blue)
                        } else {
                            /// Display subitems without checkmark
                            TextField("Enter new entry name", text: $itemViewModel.subitems[index].name) {
                                itemViewModel.editSubitemName(index: index, entry: itemViewModel.subitems[index].name)
                                itemListViewModel.save()
                            }
                            Spacer()
                        }
                    }.contentShape(Rectangle())
                    .onTapGesture {
                        /// Change the value of isTicked and reload the view page
                        itemViewModel.changeCheckmark(index: index)
                        itemViewModel.objectWillChange.send()
                        itemListViewModel.save()
                    }
                    
                }.onDelete {itemNumbers in
                    /// Delete one subitem
                    itemViewModel.removeSubitem(atOffsets: itemNumbers)
                    itemListViewModel.save()
                }.onMove { (indexSet, index) in
                    self.itemViewModel.subitems.move(fromOffsets: indexSet, toOffset: index)
                    itemListViewModel.save()
                }
                HStack {
                    /// The textfied to add a new subitem
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name:", text: $title).onSubmit {
                        itemViewModel.addSubitems(subitem: Subitem(name: title, isTicked: false))
                        itemListViewModel.save()
                        title = ""
                    }
                }
            }
            .navigationBarItems(leading:
                HStack {
                    if showUndo {
                        Button(action: {
                            /// Reset the value of isTicked to false and reload the view page
                            itemViewModel.undoResetCheckmark()
                            showUndo = !showUndo
                            itemViewModel.objectWillChange.send()
                            itemListViewModel.save()
                        }, label: {
                            Text(" Undo Reset").foregroundColor(.green)
                            .frame(minWidth: 150, alignment: .trailing)
                        })
                    } else {
                        Button(action: {
                            /// Reset the value of isTicked to false and reload the view page
                            itemViewModel.saveOldCheckmark()
                            itemViewModel.resetCheckmark()
                            showUndo = !showUndo
                            itemViewModel.objectWillChange.send()
                            itemListViewModel.save()
                        }, label: {
                            Text("Reset").foregroundColor(.red)
                            .frame(minWidth: 150, alignment: .trailing)
                        })
                    }
                }
            )
        }
    }
}

/// This is the preview
struct ItemDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailEditView(
            itemListViewModel: ItemListViewModel(
                itemViewModel: [ItemViewModel(
                    model: Item(title: "Test"),
                    subitems: [Subitem(name: "Subitem", isTicked: false)])]),
                itemViewModel: ItemViewModel(
                    model: Item(title: "Test"),
                    subitems: [Subitem(name: "Subitem", isTicked: false)]))
    }
}
