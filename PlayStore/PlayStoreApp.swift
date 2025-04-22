//
//  PlayStoreApp.swift
//  PlayStore
//
//  Created by Александр Бисеров on 22.04.2025.
//

import SwiftUI
import SwiftData

@main
struct PlayStoreApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
            User.self,
            Product.self,
            Cart.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        .modelContext(sharedModelContainer.mainContext)
    }
}
