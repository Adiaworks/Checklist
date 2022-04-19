//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation
import SwiftUI

///A ViewModel embeded with the itemViewModel of Item
struct ItemViewModel: Identifiable, Hashable {
    ///Declare the variable as an Item model
    var model: Item
    
    var id: UUID { model.id }
    
    var itemTitle: String {
        model.title
    }
    
//    mutating func editTitle(newTitle: String) {
//        model.title = newTitle
//    }
    
    ///This function can append the array of subitems with a new element
    mutating func addSubitems(subitem: String) {
        model.subitems.append(subitem)
    }
    
    mutating func editTitle(entry: String) {
        model.title = entry
    }
    
    mutating func removeSubitem(atOffsets indices: IndexSet) {
        model.subitems.remove(atOffsets: indices)
    }
}

