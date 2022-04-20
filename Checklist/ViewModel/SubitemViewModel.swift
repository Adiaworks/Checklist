//
//  ItemDetailListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

class SubitemViewModel: ObservableObject {
    /// Declare this variable as an model of Subitem
    @Published var model: Subitem

    /// Initialise this class
    init(model: Subitem) {
        self.model = model
    }
    
//    ///This function can append the array of detailListViewModel with an instance of Detail
//    func addElement(newDetail: Subitem) {
//        detailListViewModel.append(newDetail)
//    }
//
//    ///This function can remove an element with the specific index from the array of detailListViewModel
//    func remove(atOffsets indices: IndexSet) {
//        detailListViewModel.remove(atOffsets: indices)
//    }
}
