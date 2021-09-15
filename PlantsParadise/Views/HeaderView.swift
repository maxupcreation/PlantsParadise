//
//  HeaderView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .font(.largeTitle)
                    .navigationBarTitleDisplayMode(.automatic)
                    .padding()
                Text("  Plants Paradise")
                    .font(Font.custom("Didot", size: 30))
                Spacer()
            
            }
            Spacer()
            Button("Ajouter une plante") {
                // TODO: - Condition for button

            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(Constant.Color.magentaUIColor), Color(Constant.Color.blueUIColor)]), startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(8)
            .foregroundColor(.white)
            }
        }
    }


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
