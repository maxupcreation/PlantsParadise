//
//  Modifier.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/10/25.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 50))
            .frame(width: 30, height: 70)
            .foregroundColor(Color.white)
            .padding()
            .background(GradientColor().linearGradientPink())
            .clipShape(Capsule(style: .circular))
            .padding()
    }
}

extension View {
    func buttonStyle() -> some View {
        modifier(ButtonModifier())
    }
    
    func largeButton() -> some View {
        modifier(LargeButtonModifier())
    }
}

struct LargeButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 35))
            .frame(width: 325, height: 65, alignment: .center)
            .foregroundColor(.white)
            
    }
}
