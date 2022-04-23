//
//  ItemDetailEditView.swift
//  Checklist
//
//  Created by Wen Lyu on 19/4/2022.
//

import SwiftUI

struct ItemDetailEditView: View {
    /// This variable is the ItemViewModel used in this view
    @ObservedObject var itemViewModel: ItemViewModel
    
    /// This variable is used in TextField
    @State var title = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                /// Display individual checklist title with notebook icon
                Image(systemName: "note.text")
                TextField("Enter a new entry", text: $itemViewModel.model.title) {
                    itemViewModel.editTitle(entry: itemViewModel.model.title)
                }.font(.largeTitle)
            }
            List {
                /// Loop all subitems of a checklist
                ForEach(itemViewModel.subitems.indices, id:\.self) {
                    index in
                    HStack {
                        /// Display subitems with checkmark
                        if itemViewModel.subitems[index].isTicked {
                            TextField("Enter new entry name", text: $itemViewModel.subitems[index].name)
                            Spacer()
                            Image(systemName: "checkmark").foregroundColor(.blue)
                        } else {
                            /// Display subitems without checkmark
                            TextField("Enter new entry name", text: $itemViewModel.subitems[index].name)
                            Spacer()
                        }
                    }.contentShape(Rectangle())
                    .onTapGesture {
                        /// Change the value of isTicked and reload the view page
                        itemViewModel.changeCheckmark(index: index)
                        itemViewModel.objectWillChange.send()
                    }
                    
                }.onDelete {itemNumbers in
                    /// Delete one subitem
                    itemViewModel.removeSubitem(atOffsets: itemNumbers)
                }
                HStack {
                    /// The textfied to add a new subitem
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name:", text: $title).onSubmit {
                        itemViewModel.addSubitems(subitem: Subitem(name: title, isTicked: false))
                            title = ""
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                /// Reset the value of isTicked to false and reload the view page
                itemViewModel.resetCheckmark()
                itemViewModel.objectWillChange.send()
            }, label: {
                Text("Reset").foregroundColor(.green)
                .frame(minWidth: 150, alignment: .trailing)
            }))
        }
    }
}

/// This is the preview
struct ItemDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailEditView(itemViewModel: ItemViewModel(model: Item(title: "Test")))
    }
}
