//
//  Item.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//

import Foundation

///Define a new struct for Item Model
struct Item: Identifiable {
    ///Define the id as a random unique identifiers
    var id = UUID()
    
    ///Define title as a string
    var title: String
}
