//
//  ContentView.swift
//  PlayStore
//
//  Created by Александр Бисеров on 22.04.2025.
//

import SwiftUI
import SwiftData

enum AppRoute: Hashable {
    case auth
    case main(user: User)
}

struct ContentView: View {
    @State private var path: [AppRoute] = []

    var body: some View {
        NavigationStack(path: $path) {
            AuthView(onAuthSuccess: { user in
                path.append(.main(user: user))
            })
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .auth:
                    AuthView(onAuthSuccess: { user in
                        path.append(.main(user: user))
                    })
                case .main(let user):
                    MainTabView(currentUser: user)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
