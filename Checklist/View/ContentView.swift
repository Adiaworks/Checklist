//
//  ContentView.swift
//  Checklist
//
//  Created by Wen Lyu on 20/3/2022.
//

import SwiftUI

///Define a new struct
struct ContentView: View {
    @Binding var dates: [Date]
    
    ///This ia the body of the view
    var body: some View {
        NavigationView {
            List {
                ForEach(dates, id: \.self) { date in
                    Text("\(date)")
                }.onDelete { itemNumbers in
                    dates.remove(atOffsets: itemNumbers)
                }
            }
            .navigationTitle("Checklist")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                withAnimation {
                    self.dates.append(Date.now)
                }
                }, label: {
                    Image(systemName: "plus")
                }))
            }
        }
    }


/////Define a new struct
//struct ContentView_Previews: PreviewProvider {
//    var dates = [Date.now, Date.now];
//    static var previews: some View {
//        
//        ContentView($dates: $dates)
//    }
//}
