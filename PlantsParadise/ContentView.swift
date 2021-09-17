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
        WelcomeView(coreDM: CoreDataManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


