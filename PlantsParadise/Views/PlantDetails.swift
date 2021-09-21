//
//  PlantDetails.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/21.
//

import SwiftUI

struct PlantDetails: View {
    let flowerName: String
    let reminderDays: String
    let imageName: String
    let gradientColor = GradientColor()
    
    var body: some View {
        
        VStack {
            HStack(spacing: 30) {
                Image(uiImage: UIImage(named: imageName)!)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    
                Text(flowerName)
                    .font(Font.custom("Didot", size: 22))
                Text(reminderDays)
                    .frame(width: 50, height: 50)
                    .background(gradientColor.linearGradientBlue())
                    .foregroundColor(.white)
                    .clipShape(Capsule(style: .circular))
            }
            Spacer()
            
            VStack {
                Button("Ajouter cette plante") {
                    
                }
                .font(Font.system(size: 30))
                .frame(width: 300, height: 40)
                .padding()
                .background(gradientColor.linearGradientPink())
                .foregroundColor(.white)
                .clipShape(Capsule(style: .circular))
            }
        }
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetails(flowerName: "Nom de la plante", reminderDays: 2, imageName: "Flower_Example")
    }
}
