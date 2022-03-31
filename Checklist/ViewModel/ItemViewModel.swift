//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation

///A ViewModel embeded with the model of Item
struct ItemViewModel: Identifiable {
    ///Declare item as an Item model
    var item: Item
    
    ///Declare id as a random unique identifiers
    var id: UUID {item.id}
    
    ///Declare the title column of Item model as a string 
    var itemTitle: String {
        item.title
    }
}
