//
//  HeaderView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
let coreDM: CoreDataManager
var plantName = ""

    
    @State private var isPresentedBool = false
    @State private var plants: [Plants] = [Plants]()
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(plants, id:\.self) { item in
                        Text(item.name ?? "no data")
                    }
                }.cornerRadius(8)
                VStack{
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
                .navigationBarItems(leading:
                                        HStack {
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
            AddPlants(coreDM: CoreDataManager())
        }
        .onAppear {
            plants = coreDM.getAllPlants()
        }
    }
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(coreDM: CoreDataManager())
    }
}
