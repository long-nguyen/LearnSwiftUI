//
//  TestLayoutView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/20/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct TestLayoutView: View {
    var body: some View {
        VStack {
            //Dùng frame để khai báo độ rộng của view, alignment là để align các thành phần bên trong của frame so với frame. Có thể dùng offset để đẩy nó vào trong 1 chút(giống margin của android
            //Còn alignment của VStack thì là các thành phần nó align với nhau
            //
            VStack(alignment: .leading, spacing: 0) {
                Text("Swift UI ádasdasd")
                    //Divider()
                //Spacer thì có bao nhiêu spacer là màn hình sẽ chia làm bấy nhiêu phần. Có thể set frame cho spacer
                    //Spacer()
                Text("Rocks")
            }.frame(minWidth:0, maxWidth: .infinity, alignment: .trailing).offset(x: -20, y: 0)
            
            Divider()
            
            HStack (alignment: .center) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            Divider()
            
            //Ví dụ sử dụng alignment guide
            VStack(alignment: .leading) {
                Text("Hello, world!")
                    .alignmentGuide(.leading) { d in d[.trailing] }
                Text("This is a longer line of text")
            }.background(Color.red)
                .frame(width: 400, height: 100)
                .background(Color.blue)
            
            //Ví dụ sử dụng zstack nhưng có order layer
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .zIndex(1)

                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            }
            
            Spacer()
        }.background(Color.gray)
            //Thêm cái này vào để full screen luôn
//            .edgesIgnoringSafeArea(.all)
    }
}

//Vì thằng body chỉ nhận 1 view thôi nên phải đưa vào group, còn thì thông thường là if vẫn dùng bên trong được
struct TestMultiView: View {
    var body: some View {
        Group {
            if Bool.random() {
                Image("example-image")
            } else {
                Text("Better luck next time")
            }
        }
    }
}

struct TestGeometryReader:View {
    var body: some View {
        //Dùng geomery reader để set độ rộng của view theo %
        GeometryReader { geometry in
                   HStack(spacing: 0) {
                       Text("Left")
                           .frame(width: geometry.size.width / 3, height: 50)
                           .background(Color.yellow)
                       Text("Right")
                           .frame(width: 2*geometry.size.width / 3, height: 50)
                           .background(Color.orange)
                   }
               }
    }
}

struct TestLayoutView_Previews: PreviewProvider {
    static var previews: some View {
        TestGeometryReader()
    }
}
