//
//  Detail.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

///Define a new struct for Detail Model
struct Subitem: Identifiable {
    ///Define the id as a random unique identifier
    var id = UUID()
    
    ///Define title as a string
    var title: String
}
