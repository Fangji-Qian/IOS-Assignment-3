//
//  RegisterView.swift
//  IOS Assignment 3
//
//  Created by admin on 5/14/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isRegistrationComplete: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Register")
                    .font(.largeTitle)
                    .padding()
                
                TextField("E-Mail", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    if validatePassword(password) {
                        registerUser(email: email, password: password)
                    }
                    else {
                        self.alertMessage = "Password must contail at least one uppercase, one lowercase and one number, 8-15 characters long."
                        self.showAlert = true
                    }
                })
                {
                    Text("Register")
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.gray)
                        .cornerRadius(10)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Invalid Password"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                }
                .padding()
                
                NavigationLink(destination: LoginView(), isActive: $isRegistrationComplete) {
                    EmptyView()
                }
                
                NavigationLink(destination: LoginView()) {
                    Text("Already have account?")
                        .foregroundStyle(Color.blue)
                }
            }
            .padding()
        }
    }
    
    func registerUser(email: String, password: String) {
        if DatabaseManager.shared.registerUser(email: email, password: password) {
            isRegistrationComplete = true
        }
        else {
            alertMessage = "Registration failed. Please try again."
            showAlert = true
        }
    }
    
    func validatePassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)[A-Za-z\\d]{8,15}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
}

#Preview {
    RegisterView()
}
