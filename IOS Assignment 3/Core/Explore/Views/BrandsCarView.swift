//
//  BrandsCarView.swift
//  IOS Assignment 3
//
//  Created by admin on 5/12/24.
//

import SwiftUI

struct BrandsCarView: View {
    var brand: Brand
    @StateObject var viewModel: ExploreViewModel
    @Binding var bookedTrips: [Trip]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(brand.brandName) Car")
                .font(.headline)
                .fontWeight(.semibold)

            ForEach(filteredCars) { car in
                if let index = viewModel.cars.firstIndex(of: car) {
                    NavigationLink(destination: DetailCarView(viewModel: viewModel, index: index, bookedTrips: $bookedTrips)) { 
                        TopCarsView(cars: [car], bookedTrips: $bookedTrips)
                    }
                }
            }
        }
        .padding()
    }

    private var filteredCars: [Car] {
        viewModel.cars.filter { $0.brand == brand.brandName }
    }
}

#Preview {
    BrandsCarView(brand: ExploreViewModel().brand[0], viewModel: ExploreViewModel(), bookedTrips: .constant([])) 
}
