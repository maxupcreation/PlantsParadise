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
    @State private var isPresentedBool = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                VStack {
                    List{
                        
                    }.cornerRadius(8
                    )
                }
                VStack{
                    Button("Ajouter une plante") {
                        isPresentedBool.toggle()
                  
                    }.sheet(isPresented: $isPresentedBool) {
                        AddPlantsSwiftUIView()
                                 }
                    
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
                        .frame(width: 40, height: 40)
                        .font(.largeTitle)
                    
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar { // <2>
                            ToolbarItem(placement: .navigation) { // <3>
                                VStack {
                                    Text("Plants Paradise") .font(Font.custom("Didot",size:18))
                                }
                            }
                        }
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
