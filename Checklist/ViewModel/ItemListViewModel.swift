//
//  ItemListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import Foundation

class ItemListViewModel: ObservableObject, Identifiable {
    /// Declare this variable as an array which consists of ItemViewModel
    @Published var itemViewModel = [ItemViewModel]()
    
    /// This function can append the array of itemViewModel with an instance of Item
    ///
    /// - Returns an array with appended new element
    func addElement() {
        itemViewModel.append(ItemViewModel(model: Item(title: "Checklist")))
    }
    
    /// This function can remove an element with the specific index from the array of itemViewModel
    ///
    /// - Parameter indices: the position of the element to be removed
    /// - Returns an array without the element in the position of indices
    func remove(atOffsets indices: IndexSet) {
        itemViewModel.remove(atOffsets: indices)
    }
}
