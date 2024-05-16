//
//  LegalView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 16/5/2024.
//

import SwiftUI

struct LegalView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Legal Information")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("The following legal information applies to the use of UTS RENTCAR. Please read carefully.")
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Terms and Conditions")
                        .font(.headline)
                    Text("Detailed information about our terms and conditions.")
                    
                    Text("Privacy Policy")
                        .font(.headline)
                    Text("How we collect, use, and protect your personal information.")
                    
                    Text("User Agreement")
                        .font(.headline)
                    Text("The agreement between UTS RENTCAR and its users.")
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Legal")
        .background(Color(.systemGray6))
    }
}

struct LegalView_Previews: PreviewProvider {
    static var previews: some View {
        LegalView()
    }
}

