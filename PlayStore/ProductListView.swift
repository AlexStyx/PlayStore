import SwiftUI
import SwiftData

struct ProductListView: View {
    @Environment(\.modelContext) private var modelContext
    let currentUser: User
    
    @State private var searchQuery: String = ""
        
    @Query private var products: [Product]
    
    private var isSeller: Bool {
        currentUser.correctedType == .seller
    }
    
    private var filteredItems: [Product] {
        if isSeller {
            products.filter { $0.author == currentUser.email && ($0.title.lowercased().contains(searchQuery.lowercased()) || $0.desc.lowercased().contains(searchQuery.lowercased()) || searchQuery.isEmpty) }
        } else {
            products.filter { $0.title.lowercased().contains(searchQuery.lowercased()) || $0.desc.lowercased().contains(searchQuery.lowercased()) || searchQuery.isEmpty }
        }
    }
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(filteredItems) { product in
                    if isSeller {
                        ProductRow(product: product)
                    } else {
                        NavigationLink(destination: ProductDetailView(product: product, currentUser: currentUser)) {
                            ProductRow(product: product)
                        }
                    }
                }
                .navigationTitle("Товары")
            }
            .toolbar {
                if isSeller {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CreateProductView(currentUser: currentUser)) {
                            Text("Добавить товар")
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .searchable(text: $searchQuery, prompt: "Search")
        }
    }
}



struct ProductRow: View {
    var product: Product
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: product.image)!)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(5)
                .padding(5)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.headline)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}
