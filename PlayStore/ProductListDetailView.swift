import SwiftUI
import SwiftData

struct ProductDetailView: View {
    @Environment(\.modelContext) private var modelContext

    var product: Product
    var currentUser: User

    
    @Query private var cart: [Cart]
    
    var current: Cart? {
        cart.first(where: { $0.product == product.id })
    }
    
    private var isAdded: Bool {
        current != nil
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // Пример изображения товара
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding()
                
                Text(product.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.title2)
                    .foregroundColor(.green)
                    .padding(.bottom, 5)
                
                Text(product.desc)
                    .font(.body)
                    .padding(.bottom, 15)
                
                // Кнопка для добавления товара в корзину
                Button(action: {
                    if isAdded {
                        modelContext.delete(current!)
                    } else {
                        modelContext.insert(Cart(user: currentUser.email, product: product.id))
                    }
                    
                    try! modelContext.save()
                }) {
                    Text(isAdded ? "Убрать из корзины" : "Добавить в корзину")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isAdded ? Color.gray : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle(product.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
