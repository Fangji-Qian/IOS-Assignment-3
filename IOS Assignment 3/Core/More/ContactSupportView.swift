//
//  ContactSupportView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 16/5/2024.
//

import SwiftUI

struct ContactSupportView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Contact Support")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("If you need any assistance, please contact our support team. We're here to help!")
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email Support")
                        .font(.headline)
                    Text("support@utsrentcar.com")
                    
                    Text("Phone Support")
                        .font(.headline)
                    Text("+61 123 456 999")
                    
                    Text("Live Chat")
                        .font(.headline)
                    Text("Available 24/7 in the app")
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Contact Support")
        .background(Color(.systemGray6))
    }
}

struct ContactSupportView_Previews: PreviewProvider {
    static var previews: some View {
        ContactSupportView()
    }
}

