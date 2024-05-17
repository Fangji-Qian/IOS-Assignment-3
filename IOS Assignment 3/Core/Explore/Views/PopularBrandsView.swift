//
//  PopularBrandsView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct PopularBrandsView: View {
    @StateObject private var viewModel: ExploreViewModel
    @Binding var bookedTrips: [Trip] 

    init(viewModel: ExploreViewModel, bookedTrips: Binding<[Trip]>) { 
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._bookedTrips = bookedTrips 
    }

    var body: some View {
        VStack {
            HStack {
                Text("Brands")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: {}, label: {
                    Text("See All")
                        .font(.footnote)
                        .fontWeight(.semibold)
                })
            }
            .foregroundStyle(.white)
            .padding()

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.brand) { brand in
                        NavigationLink(destination: BrandsCarView(brand: brand, viewModel: viewModel, bookedTrips: $bookedTrips)) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.white)
                                .frame(width: 150, height: 200)
                                .overlay {
                                    VStack {
                                        Image(brand.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                        Text(brand.brandName)
                                    }
                                }
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

#Preview {
    PopularBrandsView(viewModel: ExploreViewModel(), bookedTrips: .constant([]))
}
