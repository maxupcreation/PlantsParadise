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
        HeaderView()
    }
}

extension Color {
    static let ui = Color.UI()
    struct UI {
        let yellow = Color("yellow")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


