//
//  PlantsParadiseApp.swift
//  PlantsParadise
//
//  Created by Maxime on 03/09/2021.
//

import SwiftUI

@main
struct PlantsParadiseApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
