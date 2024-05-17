//
//  PaymentView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 17/5/2024.
//

import SwiftUI

struct PaymentView: View {
    var totalPrice: Int
    
    var body: some View {
        VStack {
            Text("Payment")
                .font(.largeTitle)
                .padding()
            
            Text("Total: \(totalPrice)$")
                .font(.title)
                .padding()
            
            Button(action: {
                // Handle payment processing here
            }) {
                Text("Pay Now")
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PaymentView(totalPrice: 100)
}
