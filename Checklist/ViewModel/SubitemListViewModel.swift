//
//  SubitemListViewModel.swift
//  Checklist
//
//  Created by Wen Lyu on 20/4/2022.
//

import Foundation

class SubitemListViewModel: ObservableObject {
    /// Declare this variable as an array which consists of SubitemViewModel
    @Published var subitemViewModel = [SubitemViewModel]()
    
    ///This function can append the array of subitemViewModel with an instance of Subitem
    ///
    /// - Returns an array with appended new element
    func addElement() {
        subitemViewModel.append(SubitemViewModel(model: Subitem(name: "Checklist", isTicked: false)))
    }
    
    /// This function can remove an element with the specific index from the array of subitemViewModel
    ///
    /// - Parameter indices: the position of the element to be removed
    /// - Returns an array without the element in the position of indices
    func remove(atOffsets indices: IndexSet) {
        subitemViewModel.remove(atOffsets: indices)
    }
}
