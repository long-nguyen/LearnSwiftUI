//
//  AnimationView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/20/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct AnimationView: View {
    @State private var scale: CGFloat = 1
    @State private var borderThickness: CGFloat = 1
    @State private var angle: Double = 0
    @State private var showingWelcome = false
    @State private var opacity = 1.0
    @State private var half = false
    @State private var dim = false

    //Sử dụng .animation này thì nó sẽ animate mọi thay đổi luôn chứ ko chỉ scaleEffect
    //Ví dụ borderThickness nó cũng thay đổi từ từ luôn
    //Animation có thể là linear, easeIn, easeOut
    var body: some View {
        VStack {
            //Implicit animation
            Button(action: {
                self.scale += 0.3
                self.borderThickness += 1
            }) {
                Text("Button with animation")
                    .border(Color.red, width: borderThickness)
                    .scaleEffect(scale)
                    .animation(.easeIn(duration: 3))
            }
            //Implicit animation
            Button(action: {
                self.angle += 45
            }) {
                Text("Animation 2")
                .padding()
                    .rotationEffect(.degrees(angle))
                    .animation(.spring())
            }
            //Implicit animation
            Toggle(isOn: $showingWelcome.animation()) {
                Text("Toggle label")
            }.padding()
            if showingWelcome {
                Text("Hello World")
            }
            
            //Explicit animation - Nên dùng
            Button(action:{
                withAnimation(.linear(duration: 1)) {
                    self.opacity -= 0.2
                }
            }) {
                Text("Explicit animation")
                .padding()
                .opacity(opacity)
            }
            
            //Animation khi click
            Image("cheese-toastie-thumb")
                .scaleEffect(half ? 0.5 : 1.0)
                .opacity(dim ? 0.5 : 1.0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        self.half.toggle()
                        self.dim.toggle()
                    }
            }
        }
        
        
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
