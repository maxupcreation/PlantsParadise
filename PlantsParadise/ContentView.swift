//
//  ContentView.swift
//  PlantsParadise
//
//  Created by Maxime on 03/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
 
    var body: some View {
       
        let blueUIColor = UIColor(named: "BlueParadise")!
        let magentaUIColor = UIColor(named: "MagentaParadise")!
      
                Button("Ajouter une plante") {}
                .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [Color(magentaUIColor),Color(blueUIColor)]), startPoint: .top, endPoint: .bottom)
                    )
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

extension Color {
    static let ui = Color.UI()
    
    struct UI {
         let yellow = Color("yellow")
    }
}
