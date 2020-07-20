//
//  ItemView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/19/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct ItemCell: View {
    //Tạo 1 dictionary
    let colors:[String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var data: MenuItem
    var index: Int
    
    //hàm body luôn trả lại view
    var body: some View {
        HStack {
            Image(data.thumbnailImage).clipShape(Circle()).overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
    // Text("This is no regular sundae – it's a super sundae! I think that means it wears glasses and has an unusual fear of kryptonite? Yeah, that sounds about right.")
                Text(data.name)
                    .lineLimit(3)
                    .minimumScaleFactor(0.2)
                    .font(.headline)
                HStack {
                    Text("Price $\(data.price)").font(.subheadline)
                    //Vì chúng ta phải loop qua cái array của string nhưng string thì ko có identifiable, do đó ta dùng self (tức tự mỗi string đã indentified)
                    ForEach(data.restrictions, id:\.self) {res in
                        Text(res)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(5)
                            .background(self.colors[res, default: .black])
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                }
            }
            Spacer()
            Button(action: {
                //action
                self.onButtonClicked(self.index)
            }) {
                Text("Button \(index)")
            }
        }
        .padding(.horizontal, 10)
            
        
    }
    
    
    func onButtonClicked(_ index: Int) {
        print(data.description)
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(data: MenuItem.example, index: 0)
    }
}
