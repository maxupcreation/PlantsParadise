//
//  PlantDetails.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/21.
//

import SwiftUI

struct PlantDetails: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let flowerName: String
    let reminderDays: String
    let plantImage: UIImage
    let gradientColor = GradientColor()

    var body: some View {
            HStack(spacing: 30) {
                Image(uiImage: plantImage)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                
                if flowerName == "" {
                    Text("Pas de nom")
                        .font(Font.custom("Didot", size: 22))
                        .foregroundColor(.black)
                } else {
                Text(flowerName)
                    .font(Font.custom("Didot", size: 22))
                    .foregroundColor(.black)
                }
                Text(reminderDays)
                    .frame(width: 50, height: 50)
                    .background(gradientColor.linearGradientBlue())
                    .foregroundColor(.white)
                    .clipShape(Capsule(style: .circular))
            }
        
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetails(flowerName: "Nom de la plante", reminderDays: "2", imageName: UIImage(named: "icons8-no_image") ?? UIImage(), coreDM: CoreDataManager())
    }
}
