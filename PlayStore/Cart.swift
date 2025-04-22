import Foundation
import SwiftData

@Model
final class Cart {
    var user: String
    var product: UUID
    
    init(user: String, product: UUID) {
        self.user = user
        self.product = product
    }
}
