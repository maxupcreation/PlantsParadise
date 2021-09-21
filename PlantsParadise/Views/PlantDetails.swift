//
//  PlantDetails.swift
//  PlantsParadise
//
//  Created by Giovanni Gaffé on 2021/9/21.
//

import SwiftUI

struct PlantDetails: View {
    let flowerName = "flower Name"
    let reminderDays = "2"
    let gradientColor = GradientColor()
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack(spacing: 30) {
                Image(uiImage: UIImage(named: "Flower_Example")!)
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
        }
    }
}

struct PlantDetails_Previews: PreviewProvider {
    static var previews: some View {
        PlantDetails()
    }
}
