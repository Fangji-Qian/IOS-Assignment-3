//
//  HowItWorksView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 16/5/2024.
//

import SwiftUI

struct HowItWorksView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("How UTS RENTCAR Works")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("UTS RENTCAR provides a seamless car rental experience tailored for university students. Follow these steps to rent a car:")
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Search for a Car")
                        .font(.headline)
                    Text("Use the search bar to find the car you want by brand, model, or other preferences.")
                    
                    Text("2. Select a Car")
                        .font(.headline)
                    Text("Browse through the available cars and select the one that suits your needs.")
                    
                    Text("3. Book the Car")
                        .font(.headline)
                    Text("Choose your rental dates and any additional options, then confirm your booking.")
                    
                    Text("4. Pick Up the Car")
                        .font(.headline)
                    Text("Follow the instructions to pick up your car at the specified location.")
                    
                    Text("5. Enjoy Your Ride")
                        .font(.headline)
                    Text("Drive safely and enjoy your rental experience with UTS RENTCAR.")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("How It Works")
        .background(Color(.systemGray6))
    }
}

struct HowItWorksView_Previews: PreviewProvider {
    static var previews: some View {
        HowItWorksView()
    }
}

