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
}
