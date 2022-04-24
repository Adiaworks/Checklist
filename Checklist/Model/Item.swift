//
//  Item.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//

import Foundation

///Define a new struct for Item Model
class Item: Identifiable, ObservableObject, Decodable, Encodable {
    ///Define title as a string
    @Published var title: String
    
    /// Initialise this class
    init(title: String) {
        self.title = title
    }
    
    /// Declare enum
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case title
    }
    
    /// Initialise Decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
    }
    
    /// This function encodes title
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
    }
}
