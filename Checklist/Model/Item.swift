//
//  Item.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//

import Foundation

///Define a new struct for Item Model
struct Item: Identifiable, Hashable, Equatable {
    ///Define the id as a random unique identifier
    var id = UUID()
    
    ///Define title as a string
    var title: String
    
    var subitems = [String]()
}
