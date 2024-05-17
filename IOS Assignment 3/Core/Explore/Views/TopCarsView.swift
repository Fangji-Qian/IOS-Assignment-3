//
//  TopCarsView.swift
//  IOS Assignment 3
//
//  Created by admin on 5/12/24.
//

import SwiftUI

struct TopCarsView: View {
    var cars: [Car]
    @Binding var bookedTrips: [Trip] 
    
    var body: some View {
        ScrollView {
            ForEach(cars) { car in
                let index = cars.firstIndex(where: {$0 == car}) ?? 0
                NavigationLink {
                    DetailCarView(viewModel: ExploreViewModel(), index: index, bookedTrips: $bookedTrips) // Pass bookedTrips binding
                        .navigationBarBackButtonHidden()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                        .frame(height: 100)
                        .overlay {
                            HStack(spacing: 10) {
                                Image(car.mainImageName)
                                    .resizable()
                                    .frame(width: 100, height: 60)
                                    .scaledToFit()
                                VStack(alignment: .leading, spacing: 10) {
                                    Text(car.carName)
                                        .font(.footnote)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.black)
                                    
                                    HStack {
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(.yellow)
                                        Text(String(format: "%.1f", car.rating))
                                            .font(.footnote)
                                            .fontWeight(.semibold)
                                            .foregroundStyle(.black)
                                    }
                                    Text("Post by: \(car.hostName)")
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                }
                                Spacer()
                            }
                            .padding()
                        }
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    TopCarsView(cars: ExploreViewModel().cars, bookedTrips: .constant([])) // Add bookedTrips binding
}
