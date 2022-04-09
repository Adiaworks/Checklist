//
//  ItemDetailView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemDetailView: View {
    @Binding var viewModel: ItemViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

///this preview needs to be fixed
//struct ItemDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetailView(itemViewModel: Date.now)
//    }
//}
