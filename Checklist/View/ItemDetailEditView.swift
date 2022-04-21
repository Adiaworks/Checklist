//
//  ItemDetailEditView.swift
//  Checklist
//
//  Created by Wen Lyu on 19/4/2022.
//

import SwiftUI

struct ItemDetailEditView: View {
    @ObservedObject var itemViewModel: ItemViewModel
    @State var title = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "note.text")
                TextField("Enter a new entry", text: $itemViewModel.model.title) {
                    itemViewModel.editTitle(entry: itemViewModel.model.title)
                }.font(.largeTitle)
            }
            List {
                /// Loop all subitems of a checklist
                ForEach(itemViewModel.subitems.indices, id:\.self) {
                    index in
                    TextField("Enter new entry name", text: $itemViewModel.subitems[index].name)
                }.onDelete {itemNumbers in
                    itemViewModel.removeSubitem(atOffsets: itemNumbers)
                }
                HStack {
                    Image(systemName: "plus.circle").foregroundColor(.green)
                    TextField("Enter new entry name:", text: $title).onSubmit {
                        itemViewModel.addSubitems(subitem: Subitem(name: title, isTicked: false))
                            title = ""
                    }
                }
            }
            .navigationBarItems(leading: Button(action: {
                print("Cool")//need a reset func here
            }, label: {
                Text("Reset").foregroundColor(.red)
                .frame(minWidth: 150, alignment: .trailing)
            }))
        }

    }
}

struct ItemDetailEditView_Previews: PreviewProvider {
//    @State static var itemViewModel = ItemViewModel(model: Item(title: "Test"), subitems: [Subitem(name: "Ginger", isTicked: false), Subitem(name: "Garlic", isTicked: false)])
    
    static var previews: some View {
        ItemDetailEditView(itemViewModel: ItemViewModel(model: Item(title: "Test")))
    }
}
