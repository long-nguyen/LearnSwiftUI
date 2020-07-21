//
//  TestComposeView.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/21/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct User {
    var name: String
    var job: String
    var email: String
    var profile: String
}

struct ProfilePicView: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 100, height: 100)
        .clipShape(Circle())
    }
}

struct EmailView: View {
    var address: String
    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct UserDetails: View {
    var user: User
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(user.job)
                .foregroundColor(.secondary)
            EmailView(address: user.email)
        }
    }
}

struct UserView: View {
    var user: User
    var body: some View {
        VStack {
            ProfilePicView(imageName: user.profile)
            UserDetails(user: user)
        }
    }
}

struct TestComposeView: View {
    let user = User(name: "Long Nguyen", job: "Kĩ sư", email: "long@gmail.com", profile: "all-out-donuts")
    var body: some View {
        VStack {
            ProfilePicView(imageName: user.profile)
            UserDetails(user: user)
            //Có thể ghép được cả text với nhiều style thế này, vãi đạn thật
            Text("SwiftUI ")
                .foregroundColor(.red)
            + Text("is ")
                .foregroundColor(.orange)
                .fontWeight(.black)
            + Text("awesome")
                .foregroundColor(.blue)
            
            //Test view modifier
            Text("This is a neon label")
                .modifier(NeonLabel(glowColor: .green))
        }
    }
}

struct TestComposeView_Previews: PreviewProvider {
    static var previews: some View {
        TestComposeView()
    }
}
