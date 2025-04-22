import SwiftData
import Foundation

@Model
final class Product {
    var id: UUID
    var title: String
    var price: Double
    var image: Data
    var desc: String
    var author: String
    
    init(id: UUID = UUID(), title: String, description: String, price: Double, image: Data, author: String) {
        self.id = id
        self.title = title
        self.desc = description
        self.price = price
        self.image = image
        self.author = author
    }
}
