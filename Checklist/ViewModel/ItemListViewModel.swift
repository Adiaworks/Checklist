//
//  ItemListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import Foundation

struct ItemListViewModel {
    var itemViewModel = [ItemViewModel]()
    
    ///This function can append the array of itemViewModel with an instance of Item
    mutating func addElement() {
        itemViewModel.append(ItemViewModel(model: Item(title: "Checklist")))
    }
    
    ///This function can remove an element with the specific index from the array of itemViewModel
    mutating func remove(atOffsets indices: IndexSet) {
        itemViewModel.remove(atOffsets: indices)
    }
}
