//
//  Item.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//

import Foundation

///Define a new struct for Item Model
class Item: Identifiable, ObservableObject {
    ///Define title as a string
    @Published var title: String
    
    /// Initialise this class
    init(title: String) {
        self.title = title
    }
}
