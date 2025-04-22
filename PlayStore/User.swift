import Foundation
import SwiftData

@Model
class User {
    var email: String
    var password: String
    var userType: String

    init(email: String, password: String, userType: String) {
        self.email = email
        self.password = password
        self.userType = userType
    }
}
