//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    @Binding var viewModel: ItemListViewModel
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            ItemListMasterView(viewModel: $viewModel)
                .navigationTitle("Checklists")
            }
        }
    }


/////Define a new struct
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: $viewModel)
//    }
//}




