//
//  WelcomeView.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/15.
//

import SwiftUI

struct WelcomeView: View {
    let coreDM: CoreDataManager
    
    @State private var isPresentedBool = false
    @State private var plants: [Plants] = [Plants]()
    let gradientColor = GradientColor()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    ForEach(plants, id:\.self) { item in
                        let amountDays = String(Int(item.reminder))
                        let noImage = UIImage(named: "icons8-no_image")!
                        HStack {
                            Image(uiImage: (UIImage(data: item.picture ?? Data()) ?? noImage))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                                .frame(width: 70, height: 70, alignment: .center)
                                .cornerRadius(20)
                            Spacer()
                            Text(item.name ?? "no data")
                            Spacer()
                            Text("\(amountDays) jours")
                        }
                    }
                }
                .cornerRadius(8)
                
                VStack {
                    Button("Ajouter une plante") {
                        isPresentedBool.toggle()
                    }
                    .font(Font.system(size: 30))
                    .frame(width: 300, height: 40, alignment: .center)
                    .padding()
                    .background(
                        gradientColor.linearGradientPink())
                    
                    .clipShape(Capsule())
                    .foregroundColor(.white)
                }
                .navigationBarItems(leading:
                                        HStack {
                                            Image("logoAlt")
                                                .resizable()
                                                .frame(width: 40, height: 65)
                                                .navigationBarTitleDisplayMode(.inline)

                                            Text(" Plants Paradise")
                                                .font(Font.custom("Didot", size: 37))
                                                .padding()
                                        })
                .navigationBarHidden(false)
            }
            .padding()
        }
        .sheet(isPresented: $isPresentedBool) {
            AddPlants(coreDM: CoreDataManager())
        }
        .onAppear {
            plants = coreDM.getAllPlants()
        }
    }

    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView(coreDM: CoreDataManager())
        }
    }
}
