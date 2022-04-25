//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation
import SwiftUI

///A ViewModel embeded with the itemViewModel of Item
class ItemViewModel: ObservableObject, Identifiable, Encodable, Decodable {
    /// Declare the variable as an Item model
    @Published var model: Item
    
    /// Declare the variable as an array which consists of subitems
    @Published var subitems = [Subitem]()
    
    /// Initialise this class
    init(model: Item, subitems: [Subitem]) {
        self.model = model
        self.subitems = subitems
    }
    
    /// This function can append the array of subitems with a new element
    ///
    /// - Parameter subitem: an instance of Subitem
    /// - Returns an array after appending the specific subitem
    func addSubitems(subitem: Subitem) {
        subitems.append(subitem)
    }
    
    /// This function transfer the old value of title to new value
    ///
    /// - Parameter entry: a new string to be assigned to the title
    /// - Returns the title with new value
    func editTitle(entry: String) {
        model.title = entry
    }
    
    /// This function remove an element from the array of subitems
    ///
    /// - Parameter indices: the index of the target element to be removed
    /// - Returns an array after removing the specific subitem
    func removeSubitem(atOffsets indices: IndexSet) {
        subitems.remove(atOffsets: indices)
    }
    
    /// This function transfer the old value of name to new value
    ///
    /// - Parameter index: Int
    /// - Parameter entry: a new string to be assigned to the title
    /// - Returns the name with new value
    func editSubitemName(index: Int, entry: String) {
        subitems[index].name = entry
    }

    /// This function change the value of isTicked
    ///
    /// - Parameter index: the index of the target checkmark to be changed
    /// - Returns the subitem with new value of isTicked
    func changeCheckmark(index: Int) {
        subitems[index].isTicked = !subitems[index].isTicked
    }
    
    /// This function reset the value of isTicked
    ///
    ///  - Returns subitems with flase value of the variable of isTicked
    func resetCheckmark() {
        subitems.forEach { subitem in
            subitem.isTicked = false
        }
    }
    
    /// Save the orignal value of isTicked
    func saveOldCheckmark() {
        subitems.forEach { subitem in
            subitem.oldIsTicked = subitem.isTicked
        }
    }
    
    /// Undo the reset to the checkmark
    func undoResetCheckmark() {
        subitems.forEach { subitem in
            subitem.isTicked = subitem.oldIsTicked
        }
    }
    
    /// Declare enum
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case model
        case subitems
    }
    
    /// Initialise Decoder
    required init(from decoder: Decoder) throws {
        /// This variable contain the data of relative CodingKeys
        let container = try decoder.container(keyedBy: CodingKeys.self)
        model = try container.decode(Item.self, forKey: .model)
        subitems = try container.decode([Subitem].self, forKey: .subitems)
    }
    
    /// This function encodes  name, isTicked, and OldIsTicked
    func encode(to encoder: Encoder) throws {
        /// This variable contain the data of relative CodingKeys
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(model, forKey: .model)
        try container.encode(subitems, forKey: .subitems)
    }
}

