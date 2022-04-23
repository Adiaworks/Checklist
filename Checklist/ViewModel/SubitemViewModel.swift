//
//  ItemDetailListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 10/4/2022.
//

import Foundation

class SubitemViewModel: ObservableObject {
    /// Declare this variable as an model of Subitem
    @Published var model: Subitem

    /// Initialise this class
    init(model: Subitem) {
        self.model = model
    }
}
