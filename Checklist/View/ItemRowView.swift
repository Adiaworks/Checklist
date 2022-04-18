//
//  ItemRowView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI


struct ItemRowView: View {
    @Binding var viewModel: ItemViewModel
    @Environment(\.editMode) var editMode
    @State var title = "Checklist"
    
    var body: some View {
        Text(viewModel.itemTitle)
    }
}

///this preview needs to be fixed
//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(itemViewModel: Date.now)
//    }
//}

//struct ItemRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRowView()
//    }
//}
