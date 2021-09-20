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
                        HStack {
                            Image(uiImage: UIImage(data: item.picture ?? Data()) ?? UIImage())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 70, height: 70, alignment: .center)
                                .cornerRadius(20)
                            Spacer()
                            Text(item.name ?? "no data")
                            Spacer()
                            Text(String(item.reminder))
                        }
                    }
                }
                .cornerRadius(8)
                
                VStack{
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
                                                .font(.largeTitle)
                                                .navigationBarTitleDisplayMode(.automatic)
                                            
                                            Text(" Plants Paradise")
                                                .font(Font.custom("Didot", size: 40))
                                        })
                .navigationBarHidden(false)
            }
            .padding()
          

        }
        
        .background(Color.red)

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
