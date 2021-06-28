//
//  AppView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/19/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            MenuListview()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            OrderView()
                .tabItem{
                    Image(systemName: "square.and.pencil")
                    Text("Order" )
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
