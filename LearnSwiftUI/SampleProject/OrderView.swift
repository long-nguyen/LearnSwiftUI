//
//  OrderView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/19/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var pref:PreferenceMng

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(pref.order.items) {item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItem)
                }
                if pref.order.items.count > 0 {
                    Section {
                        NavigationLink(destination: CheckoutView()) {
                            Text("Order")
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Order")
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    
    func deleteItem(at offset: IndexSet) {
        pref.order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView()
    }
}
