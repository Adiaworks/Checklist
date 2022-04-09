//
//  ItemListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import Foundation

struct ItemListViewModel {
    var model = [Date]()
    
    ///This function can append the array of model with an instance of Date
    mutating func addElement() {
        model.append(Date.now)
    }
    
    ///This function can remove an element with the specific index from the array of model
    mutating func remove(atOffsets indices: IndexSet) {
        model.remove(atOffsets: indices)
    }
}
