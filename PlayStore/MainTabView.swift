import SwiftUI

struct MainTabView: View {
    @Bindable var currentUser: User

    var body: some View {
        TabView {
            ProfileView(user: currentUser)
                .tabItem {
                    Label("Профиль", systemImage: "person.circle")
                }

            
            // Мжешь добавить другие табы здесь
            Text("Другой экран")
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
