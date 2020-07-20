//
//  TestView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/20/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct TestView: View {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter
    }()
    var pct: CGFloat = 0.0
    var now = Date()
    
    var body: some View {
        VStack {
            Text("Custom font, World!")
                .font(Font.custom("HoboStd", size: 22))
                .foregroundColor(Color("ButtonColorGradient.Start"))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).offset(x: 30, y: 10)
                .padding(.bottom, 20)
            
            Image("full-english")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            //Lưu ý gradient chỉ nên áp dụng cho 1 dòng
            Text("Gradient Text")
                .font(Font.custom("HoboStd", size: 22))
                .foreground(LinearGradient(gradient: Gradient(colors: [Color("goldColorGradient.Start"),Color("goldColorGradient.End"), Color("ButtonColorGradient.Start") ]), startPoint: .top, endPoint: .bottom))
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).offset(x: 30, y: 10)
                .padding(.bottom, 20)
            
            Text("Shadow Text with Dateformatter, now: \(now, formatter:Self.dateFormatter)")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 40 , alignment: .leading)
                .foreground(LinearGradient(gradient: Gradient(colors: [Color("ButtonColorGradient.Start"),Color("goldColorGradient.End") ]), startPoint: .top, endPoint: .bottom))

                .shadow(color: .gray, radius: 1.0, x:0, y:2)
                .lineLimit(3)
                .minimumScaleFactor(0.2)
                .font(.body)
                .padding([.leading, .trailing, .bottom], 20)
            
            //Neon efffect
            HStack {
                 Text("Hacking with Swift")
                    .font(Font.custom("HoboStd", size: 22))
                    .foregroundColor(.white)
                    .padding()
                    .shadow(color: .red, radius: 1)
                    .shadow(color: .red, radius: 4)
                    .shadow(color: .red, radius: 8)
            }.padding(20).background(Color.black)
               
            
                
            
            Button(action: {
                //action
            }) {
                HStack {
                    //Button that has icon and text
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.callout)
                    Text("Grd bt shadow")
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
        
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
