import SwiftUI

struct ProfileView: View {
    @Bindable var user: User
    @State private var isEditing = false
    @State private var editedEmail: String = ""
    @State private var editedPassword: String = ""

    var body: some View {
        Form {
            Section(header: Text("Профиль")) {
                if isEditing {
                    TextField("Email", text: $editedEmail)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)

                    SecureField("Пароль", text: $editedPassword)
                } else {
                    HStack {
                        Text("Email")
                        Spacer()
                        Text(user.email)
                            .foregroundColor(.gray)
                    }
                    HStack {
                        Text("Пароль")
                        Spacer()
                        Text(String(repeating: "•", count: max(6, user.password.count)))
                            .foregroundColor(.gray)
                    }
                }
            }

            Section {
                Text("Тип пользователя: \(user.userType)")
                    .foregroundColor(.gray)
            }

            Section {
                Button(isEditing ? "Сохранить" : "Редактировать") {
                    if isEditing {
                        if !editedEmail.isEmpty { user.email = editedEmail }
                        if !editedPassword.isEmpty { user.password = editedPassword }
                    } else {
                        editedEmail = user.email
                        editedPassword = user.password
                    }

                    withAnimation {
                        isEditing.toggle()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.blue)
            }
        }
        .navigationTitle("Профиль")
        .navigationBarBackButtonHidden(true)
    }
}
