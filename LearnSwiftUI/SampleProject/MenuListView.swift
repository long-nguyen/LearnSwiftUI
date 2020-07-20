//
//  SampleView.swift
//  TestWidgetKit (iOS)
//
//  Created by Nguyen Tien Long on 7/18/20.
//

import Foundation
import SwiftUI

struct MenuListview: View {
    @EnvironmentObject var order: Order
    
    @State var title: String = "Hello Long"
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            //            VStack {
            //                Button("test me") {
            //                    title = "something else"
            //                }
            //                Text(title).padding()
            //            }
            List {
                //Để mà nhét được list vào cái ForEach này thì list item cần protocol Identifiable và có biến id unique
                ForEach(menu) {section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items.indices) {index in
                            NavigationLink(destination: MenuDetail(data:section.items[index])) {
                                ItemCell(data:section.items[index], index: index)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu")
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListview()
    }
}
