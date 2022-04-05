//
//  ItemTitleView.swift
//  Checklist
//
//  Created by Wen Lyu on 5/4/2022.
//

import SwiftUI

struct ItemTitleView: View {
    var model: ItemViewModel
    
    var body: some View {
        Text("\(model.itemTitle)")
    }
}

struct ItemTitleView_Previews: PreviewProvider {
    static var previews: some View {
        ItemTitleView(model: ItemViewModel(item: Item(title: "Rockmelon")))
    }
}
