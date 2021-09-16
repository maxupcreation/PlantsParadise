//
//  PlantsCardView.swift
//  PlantsParadise
//
//  Created by Maxime on 16/09/2021.
//

import SwiftUI

struct PlantsCardView: View {
    var plants: [Plants] = []
     
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            Text(plants.name ?? "no data")
        
        }
    }
    
    mutating func returnPlantsData() {
        plants = coreDM.getAllPlants()
    }
   
}

struct PlantsCardView_Previews: PreviewProvider {
    static var previews: some View {
        PlantsCardView(plants:[], coreDM: CoreDataManager())
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
