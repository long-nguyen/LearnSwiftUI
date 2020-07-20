//
//  TestTransformingView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/20/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

//Dùng offset thì đẩy view dịch sang so với vị trí hiện tại của nó, nhưng lại ko dịch những cái bên cạnh nó. Nên bị đè lên nhau

struct TestTransformingView: View {
    @State private var rotation = 20.0

    var body: some View {
    
        VStack {
            //Tạo 1 cái view gì đó có border và overlay
            //Tip: Use stroke() with shapes, and border() with other view types.
           Text("Forecast: Sun")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.orange)
                .padding()
                .background(Color.yellow)
                .border(Color.green, width: 3)
                .overlay( RoundedRectangle(cornerRadius: 16).stroke(Color.blue, lineWidth: 4))
    
            ZStack {
                //Tạo 1 ảnh với hiệu ứng blur và multiple color
                Image("cheese-toastie")
                    .blur(radius: 5)
//                    .contrast(0.5)
//                    .saturation(0.5)
//                    .colorMultiply(.white)


                VStack {
                    //Tạo 1 button có ảnh bên trong có icon và phần nền được clip lại. Có thể là Circle, RoundedRectangle hoặc Capsule
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.green)
                        // .clipShape(RoundedRectangle(cornerRadius: 12))
                            .clipShape(Capsule())
                    }
                    
                   
                    
                    //Tạo hiệu ứng shadow cho text có border
                    Text("Hacking with Swift")
                        .font(Font.custom("HoboStd", size: 22))
                        .foregroundColor(.white)
                        .padding()
                        .border(Color.red, width: 3)
                        .shadow(color: .red, radius: 2)
                        .shadow(color: .red, radius: 3)
                        .shadow(color: .red, radius: 5)
                        .padding()
                    
                    //Hiệu ứng corner radius, opacity
                    Button(action: {}) {
                        Text("I am opacity").foregroundColor(.white)
                    }.padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .opacity(0.5)
                }
                
            }
            
            //Ví dụ ta rotate 1 đoạn text
            //Set accentColor giống set tint color ở uikit
            VStack {
                Slider(value: $rotation, in: 0...360, step: 1.0)
                Text("I am rotated")
                    .rotationEffect(.degrees(rotation), anchor: .topLeading)
            }.accentColor(.orange)
            
        }
        
        
    }
}

struct TestTransformingView_Previews: PreviewProvider {
    static var previews: some View {
        TestTransformingView()
    }
}
