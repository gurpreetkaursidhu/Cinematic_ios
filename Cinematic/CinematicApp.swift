//
//  CinematicApp.swift
//  Cinematic
//
//  Created by Shubham Dhamane on 14/12/22.
//

import SwiftUI

@main
struct CinematicApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
