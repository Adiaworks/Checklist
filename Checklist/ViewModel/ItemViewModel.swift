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
    
    /// This function can append the array of subitems with a new element
    ///
    /// - Parameter subitem: an instance of Subitem
    /// - Returns an array after appending the specific subitem
    func addSubitems(subitem: Subitem) {
        subitems.append(subitem)
    }
    
    /// This function transfer the old value of title to new value
    ///
    /// - Parameter entry: a new string to be assigned to the title
    /// - Returns the title with new value
    func editTitle(entry: String) {
        model.title = entry
    }
    
    /// This function remove an element from the array of subitems
    ///
    /// - Parameter indices: the index of the target element to be removed
    /// - Returns an array after removing the specific subitem
    func removeSubitem(atOffsets indices: IndexSet) {
        subitems.remove(atOffsets: indices)
    }
    
    /// This function change the value of isTicked
    ///
    /// - Parameter index: the index of the target checkmark to be changed
    /// - Returns the subitem with new value of isTicked
    func changeCheckmark(index: Int) {
        subitems[index].isTicked = !subitems[index].isTicked
    }
    
    /// This function reset the value of isTicked
    ///
    ///  - Returns subitems with flase value of the variable of isTicked
    func resetCheckmark() {
        subitems.forEach { subitem in
            subitem.isTicked = false
        }
    }
}

