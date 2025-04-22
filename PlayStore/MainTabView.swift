import SwiftUI

struct MainTabView: View {
    @Bindable var currentUser: User

    var body: some View {
        TabView {
            ProfileView(user: currentUser)
                .tabItem {
                    Label("Профиль", systemImage: "person.circle")
                }
    
            
            // Можешь добавить другие табы здесь
            ProductListView(currentUser: currentUser)
                .tabItem {
                    Label("Объявления", systemImage: "list.bullet")
                }
            
            if (currentUser.correctedType == .buyer) {
                CartView(currentUser: currentUser)
                    .tabItem {
                        Label("Корзина", systemImage: "cart")
                    }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
