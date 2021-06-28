//
//  SampleView.swift
//  TestWidgetKit (iOS)
//
//  Created by Nguyen Tien Long on 7/18/20.
//

import Foundation
import SwiftUI

//TODO: trien khai baseview https://www.iosapptemplates.com/blog/swiftui/viewmodifier-viewbuilder

struct MenuListview: View {
    @EnvironmentObject var pref:PreferenceMng
    
    @State var title: String = "Hello Long"
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    init() {
        LOG("Init")
        //Init variable ok
    }
    
    func onAppear() {
        LOG("Appeare")
        //load data ở đây OK
        
        APIMng.instance.getSystemInfo { data , error in
            if let dt = data {
                pref.token = "Got token"
            }
        }
    }
    
    func onDisappear() {
        LOG("Dissapeare")
        //load data ở đây OK
    }
    
    var body: some View {
        NavigationView {
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
        .onAppear(){
            onAppear()
        }
        .onDisappear() {
            onDisappear()
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        MenuListview()
    }
}
