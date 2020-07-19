//
//  MenuDetail.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/19/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct MenuDetail: View {
    var data: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(data.mainImage)
                Text(data.photoCredit)
                    .padding(4)
                    .background(Color.init(.sRGB, white: 0, opacity: 0.5))
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -20, y: 0)
            }
            //Name
            Text(data.name)
                .font(Font.custom("HoboStd", size: 22))
                .foregroundColor(Color("ButtonColorGradient.Start"))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).offset(x: 30, y: 10)

            //Description
            Text(data.description)
                .font(.system(size: 15))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(25)
            
            Spacer()
            
            //Order button
            Button(action: {
                //action
                self.order.add(item: self.data)
            }) {
                HStack {
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.callout)
                    Text("Order this")
                        .padding()
                        .font(.callout)
                }
                    //tạo kích cỡ cho button, có thể chọn là .infinity để full width luôn (nhớ là thêm padding 2 cạnh bên)
                    .frame(width: 200, height: 45, alignment: .center)
                    .foregroundColor(Color.white)
                    //Chúng ta sẽ tạo 1 gradient button, lấy nó từ color assets
                    .background(LinearGradient(gradient: Gradient(colors: [Color("ButtonColorGradient.Start"), Color("ButtonColorGradient.End")]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(23)
                    //Tạo thêm shadow cho no
                    .shadow(color: .gray, radius: 5.0, x:5, y:2)
                    .padding(.bottom, 20)
            }
            
        }
            .navigationBarTitle(Text(data.name), displayMode: .inline)
    }
}

struct MenuDetail_Previews: PreviewProvider {
    //Bởi vì cái menu detail này nó dùng 1 biến Environment Object nên để preview nó được thì phải tạo 1 cái sample order parameter thế này
    static let order = Order()
    static var previews: some View {
        NavigationView {
            MenuDetail(data: MenuItem.example).environmentObject(order)
        }
        
    }
}
