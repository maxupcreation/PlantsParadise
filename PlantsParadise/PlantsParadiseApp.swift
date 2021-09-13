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
    
    @Environment(\.scenePhase) var scenePhase
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Apple must have changed something")
            }
        }
    }
}
