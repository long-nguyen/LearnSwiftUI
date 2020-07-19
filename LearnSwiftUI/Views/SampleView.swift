//
//  SampleView.swift
//  TestWidgetKit (iOS)
//
//  Created by Nguyen Tien Long on 7/18/20.
//

import Foundation
import SwiftUI

struct Sampleview: View {
    @State var title: String = "Hello Long"
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
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
                        ItemCell(data:section.items[index], index: index)
                    }
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        Sampleview()
    }
}
