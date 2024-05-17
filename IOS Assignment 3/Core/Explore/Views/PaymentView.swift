//
//  PaymentView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 17/5/2024.
//

import SwiftUI

struct PaymentView: View {
    var totalPrice: Int
    @State private var cardNumber: String = ""
    @State private var expiryDate: String = ""
    @State private var cvc: String = ""
    @Environment(\.dismiss) private var dismiss
    @Binding var bookedTrips: [Trip]
    var carName: String
    
    var body: some View {
        VStack {
            Text("Payment")
                .font(.largeTitle)
                .padding()
            
            Text("Total: \(totalPrice)$")
                .font(.title)
                .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                TextField("Card Number", text: $cardNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                TextField("Expiry Date (MM/YY)", text: $expiryDate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                
                TextField("CVC", text: $cvc)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                let newTrip = Trip(carName: carName, date: Date())
                bookedTrips.append(newTrip)
                dismiss()
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
    PaymentView(totalPrice: 100, bookedTrips: .constant([]), carName: "Sample Car")
}
