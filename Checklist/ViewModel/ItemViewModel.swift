//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation

///A ViewModel embeded with the itemViewModel of Item
struct ItemViewModel:Hashable {
    ///Declare item as an Item model
    var model = Date.now
    
    var text: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: model)
    }
}
