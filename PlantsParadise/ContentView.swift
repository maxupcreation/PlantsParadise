//
//  ContentView.swift
//  PlantsParadise
//
//  Created by Maxime on 03/09/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    let blueUIColor = UIColor(named: "BlueParadise")!
    let magentaUIColor = UIColor(named: "MagentaParadise")!
    
    var body: some View {
        
        NavigationView {
            
            VStack {
            VStack {
                List{
                    
                }.cornerRadius(8
                )
            }
        
            
            VStack{
               
             
                Button("Ajouter une plante") {}
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color(magentaUIColor),Color(blueUIColor)]), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
                .foregroundColor(.white)
               
            }
            .navigationBarItems(leading:
                                    HStack{
                Image("logo")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .font(.largeTitle)
                    .navigationTitle("Plants Paradise")
                    
                
            }
            )
        
        
            
        }.padding()
       
        }
     
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
