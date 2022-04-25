//
//  ItemRowView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI


struct ItemRowView: View {
    /// Declare the variable as an ItemViewModel
    @ObservedObject var viewModel: ItemViewModel
    
    /// This  variable represents the mode of the present environment
    @Environment(\.editMode) var editMode
    
    /// Declare the variable as an title
    @State var title = "Checklist"
    
    /// Declare the variable as a view
    var body: some View {
        Text(viewModel.model.title)
    }
}

/// This is the preview for ItemRowView
struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(viewModel: ItemViewModel(model: Item(title: "Test"), subitems: [Subitem(name: "Subitem", isTicked: false)]))
    }
}
