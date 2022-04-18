//
//  ItemDetailListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

struct SubitemViewModel {
    var detailListViewModel = [Subitem]()
    
    ///This function can append the array of detailListViewModel with an instance of Detail
    mutating func addElement(newDetail: Subitem) {
        detailListViewModel.append(newDetail)
    }
    
    ///This function can remove an element with the specific index from the array of detailListViewModel
    mutating func remove(atOffsets indices: IndexSet) {
        detailListViewModel.remove(atOffsets: indices)
    }
}