//
//  ItemViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 26/3/2022.
//
import Foundation

struct ItemViewModel: Identifiable {
    var item: Item
    var id: UUID {item.id}
    
    var itemTitle: String {
        item.title
    }
}
