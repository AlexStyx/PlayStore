import SwiftUI
import SwiftData

struct CreateProductView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var price: String = ""
    
    @State private var imagePickerPresented: Bool = false
    @State private var selectedImage: UIImage? = nil
    let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    func saveProduct() {
        guard !title.isEmpty, !description.isEmpty, let priceValue = Double(price), let selectedImage else {
            // Выводим ошибку, если данные невалидны
            return
        }
        
        // Создаем новый объект товара
        let newProduct = Product(title: title, description: description, price: priceValue, image: selectedImage.pngData()!, author: currentUser.email)
        
        modelContext.insert(newProduct)
        // Сохраняем товар в базе данных
        try? modelContext.save()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Информация о товаре")) {
                    TextField("Название товара", text: $title)
                    TextField("Описание товара", text: $description)
                    TextField("Цена", text: $price)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Изображение товара")) {
                    Button(action: {
                        imagePickerPresented.toggle()
                    }) {
                        Text("Выбрать изображение")
                    }
                    
                    if let selectedImage = selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                    }
                }
                
                Section {
                    Button(action: saveProduct) {
                        Text("Сохранить товар")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Добавить товар")
            .sheet(isPresented: $imagePickerPresented) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
    }
}
