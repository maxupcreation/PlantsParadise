//
//  WelcomView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/14.
//

import SwiftUI

struct WelcomView: View {
    @State private var isPresentedBool = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                }
                .cornerRadius(8)
                VStack {
                    Button("Ajouter une plante") {
                        isPresentedBool.toggle()
                    }
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(Constant.Color.magentaUIColor), Color(Constant.Color.blueUIColor)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(8)
                    .foregroundColor(.white)
                }
                .navigationBarItems(leading: HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .font(.largeTitle)
                        .navigationBarTitleDisplayMode(.automatic)
                   
                    Text("   Plants Paradise")
                        .font(Font.custom("Didot", size: 30))
                })
            }.padding()
        }
        .sheet(isPresented: $isPresentedBool) {
            AddPlants()
        }
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}
