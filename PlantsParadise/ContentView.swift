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
       
            VStack {
                Button("add  Item") {
                    Label("Add Item", systemImage: "plus")
                }
                .padding()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
