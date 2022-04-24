//
//  ItemListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import Foundation

class ItemListViewModel: ObservableObject, Identifiable, Encodable, Decodable {
    /// Declare this variable as an array which consists of ItemViewModel
    @Published var itemViewModel = [ItemViewModel]()
    
    /// Initialise the class
    init(itemViewModel: [ItemViewModel]) {
        self.itemViewModel = {
            guard let data = try? Data(contentsOf: ItemListViewModel.fileURL),
                  let model = try? JSONDecoder().decode([ItemViewModel].self, from: data) else {
                return [ItemViewModel(model: Item(title: "Checklist"), subitems: [Subitem(name: "Subitem", isTicked: false)])]
            }
            return model
        }()
    }
    
    /// This function can append the array of itemViewModel with an instance of Item
    ///
    /// - Returns an array with appended new element
    func addElement() {
        itemViewModel.append(ItemViewModel(model: Item(title: "Checklist"), subitems: [Subitem(name: "Subitem", isTicked: false)]))
    }
    
    /// This function can remove an element with the specific index from the array of itemViewModel
    ///
    /// - Parameter indices: the position of the element to be removed
    /// - Returns an array without the element in the position of indices
    func remove(atOffsets indices: IndexSet) {
        itemViewModel.remove(atOffsets: indices)
    }
    
    /// Declare enum
    enum CodingKeys: String, CodingKey, RawRepresentable {
        case itemViewModel
    }
    
    /// Initialise Decoder
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        itemViewModel = try container.decode([ItemViewModel].self, forKey: .itemViewModel)
    }
    
    /// This function encodes  name, isTicked, and OldIsTicked
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(itemViewModel, forKey: .itemViewModel)
    }
    
    /// Declare the path of JSON file
    static var fileURL: URL {
        let fileName = "checklist.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in:
                .userDomainMask).first else { return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }
    
    /// Save the encoded JSON file
    func save() {
        do {
            let data = try JSONEncoder().encode(itemViewModel)
            try data.write(to:ItemListViewModel.fileURL, options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8) else {
                return }
            print(dataString)
        } catch {
            print("Could not write file: \(error)")
        }
    }
}
