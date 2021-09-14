//
//  HeaderView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/7.
//

import SwiftUI

struct HeaderView: View {
    

    let addplant = AddPlants()
    
    @State private var isPresentedBool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(addplant.items, id:\.self) { item in
                        Text(item.name ?? "no data")
                    }
                    .onDelete(perform: removeItem)
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
            AddPlants()
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        for index in offsets {
            let item = addplant.items[index]
            PersistenceController.shared.delete(item)
        }
    }
    
}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
