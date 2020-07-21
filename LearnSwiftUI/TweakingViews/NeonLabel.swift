//
//  NeonLabel.swift
//  LearnSwiftUI
//
//  Created by Nguyen Tien Long on 7/21/20.
//  Copyright © 2020 Nguyen Tien Long. All rights reserved.
//

import SwiftUI

struct NeonLabel: ViewModifier {
    var glowColor: Color
    
    func body(content: Content) -> some View {
        content
        .foregroundColor(.white)
        .padding()
        .shadow(color: glowColor, radius: 2)
        .shadow(color: glowColor, radius: 3)
        .shadow(color: glowColor, radius: 5)
        .padding()
    }
}

