//
//  ItemListMasterView.swift
//  Checklist
//
//  Created by Wen Lyu on 9/4/2022.
//

import SwiftUI

struct ItemListMasterView: View {
    @Binding var dates: [Date]
    
    var body: some View {
        List {
            ForEach(dates, id: \.self) { date in
                ItemDetailView(model: date)
            }.onDelete { itemNumbers in
                dates.remove(atOffsets: itemNumbers)
            }
        }
        .navigationBarItems(leading: EditButton(), trailing: Button(action: {
            withAnimation {
                self.dates.append(Date.now)
            }
        }, label: {
            Image(systemName: "plus")
        }))
    }
}

//struct ItemListMasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemListMasterView(dates: [Date.now, Date.now])
//    }
//}
