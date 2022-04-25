//
//  Detail.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

///Define a new struct for Detail Model
class Subitem: Identifiable, ObservableObject, Decodable, Encodable {
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
        self.oldIsTicked = oldIsTicked
    }
    
    /// Declare enum
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case name
        case isTicked
        case oldIsTicked
    }
    
    /// Initialise Decoder
    required init(from decoder: Decoder) throws {
        /// This variable contain the data of relative CodingKeys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        isTicked = try container.decode(Bool.self, forKey: .isTicked)
        oldIsTicked = try container.decode(Bool.self, forKey: .oldIsTicked)
    }
    
    /// This function encodes  name, isTicked, and OldIsTicked
    func encode(to encoder: Encoder) throws {
        /// This variable contain the data of relative CodingKeys
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(isTicked, forKey: .isTicked)
        try container.encode(oldIsTicked, forKey: .oldIsTicked)
    }
}
