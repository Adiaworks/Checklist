//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var viewModel: ItemViewModel
    @Environment(\.editMode) var editMode
    @State var title = ""
    
    var body: some View {
        NavigationView {
        }
        .navigationTitle(viewModel.itemTitle)
//        if editMode?.wrappedValue == .active {
//            HStack {
//                Image(systemName: "plus.circle").foregroundColor(.green)
//                TextField("Enter new entry name:", text: $title) {
//                    viewModel.editTitle(newTitle: title)
//                    title = ""
//                }
//            }
//        }
    }
}

///this preview needs to be fixed
//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(itemViewModel: Date.now)
//    }
//}
