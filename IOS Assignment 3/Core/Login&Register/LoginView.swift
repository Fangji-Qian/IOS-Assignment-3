//
//  LoginView.swift
//  IOS Assignment 3
//
//  Created by admin on 5/14/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var alertMessage: String = ""
    @State private var showAlert: Bool = false
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.largeTitle)
                .padding()
            
            TextField("E-mail", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                authenticateUser(email: email, password: password)
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Login Failed !"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .padding()
            
            NavigationLink(destination: MainTabbarView(), isActive: $isAuthenticated) {
                EmptyView()
                
            }
            
            NavigationLink(destination: RegisterView()) {
                Text("Do not have account?")
                    .foregroundStyle(.blue)
            }
        }
        .padding()
    }
    
    func authenticateUser(email: String, password: String) {
        if DatabaseManager.shared.authenticateUser(email: email, password: password) {
            isAuthenticated = true
        }
        else {
            alertMessage = "Incorrect account or password, please try again."
            showAlert = true
        }
    }
}

#Preview {
    LoginView()
}

