//
//  HeaderView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    let blueUIColor = UIColor(named: "BlueParadise")!
    let magentaUIColor = UIColor(named: "MagentaParadise")!
    @State private var isPresentedBool = false
    
    var body: some View {
        NavigationView {
                VStack {
                    List{
                        
                    }.cornerRadius(8)
                VStack{
                    Button("Ajouter une plante") {
                        isPresentedBool.toggle()
                    }.sheet(isPresented: $isPresentedBool) {
                        AddPlants()
                    }
                    
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(magentaUIColor), Color(blueUIColor)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(8)
                    .foregroundColor(.white)
                }
                .navigationBarItems(leading:
                                        HStack {
                                            Image("logo")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                                .font(.largeTitle)
                                                .navigationBarTitleDisplayMode(.automatic)
//                                                .toolbar { // <2>
//                                                    ToolbarItem(placement: .navigation) { // <3>
//                                                        VStack {
//
//                                                        }
//                                                    }
//                                                }
                                            Text("   Plants Paradise")
                                                .font(Font.custom("Didot", size: 30))
                                        })
            }.padding()
        }
    }
    
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
