//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation
import SwiftUI

///A ViewModel embeded with the itemViewModel of Item
class ItemViewModel: ObservableObject, Identifiable {
    /// Declare the variable as an Item model
    @Published var model: Item
    
    /// Declare the variable as an array which consists of subitems
    @Published var subitems = [Subitem]()
    
    /// Initialise this class
    init(model: Item) {
        self.model = model
    }
    
//    mutating func editTitle(newTitle: String) {
//        model.title = newTitle
//    }
    
    /// This function can append the array of subitems with a new element
    func addSubitems(subitem: Subitem) {
        subitems.append(subitem)
    }
    
    /// This function transfer the old value of title to new value
    func editTitle(entry: String) {
        model.title = entry
    }
    
    /// This function remove an element from the array of subitems
    func removeSubitem(atOffsets indices: IndexSet) {
        subitems.remove(atOffsets: indices)
    }
}

