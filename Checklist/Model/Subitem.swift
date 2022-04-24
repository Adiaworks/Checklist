//
//  Detail.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

///Define a new struct for Detail Model
class Subitem: Identifiable, ObservableObject {
    /// Define the variable as a string
    @Published var name: String
    
    /// Define the variable as a bool
    @Published var isTicked: Bool = false
    
    /// Define the variable as a bool
    @Published var oldIsTicked: Bool = false
    
    /// Initialise this class
    init(name: String, isTicked: Bool) {
        self.name = name
        self.isTicked = isTicked
    }
}
