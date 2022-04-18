//
//  ItemDetailEditView.swift
//  Checklist
//
//  Created by Wen Lyu on 19/4/2022.
//

import SwiftUI

struct ItemDetailEditView: View {
    @State var title = "Checklist"
    
    var body: some View {
        NavigationView {
            HStack {
                Image(systemName: "plus.circle").foregroundColor(.green)
            }
            TextField("Enter new entry name: ", text: $title) {
                //                    viewModel.editElement(indices: myTextField.text)
                title = ""
            }
        }

    }
}

struct ItemDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailEditView()
    }
}
