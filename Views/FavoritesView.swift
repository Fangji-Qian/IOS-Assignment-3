//
//  FavoritesView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var viewModel: ExploreViewModel
    @Binding var bookedTrips: [Trip]
    var favoriteCars: [Car]
    
    init(viewModel: ExploreViewModel, bookedTrips: Binding<[Trip]>) { // Modify initializer
        self._viewModel = StateObject(wrappedValue: viewModel)
        self._bookedTrips = bookedTrips
        favoriteCars = viewModel.cars.filter({ $0.isFavorite == true })
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(favoriteCars) { car in
                        let index = viewModel.cars.firstIndex(where: {$0 == car}) ?? 0
                        NavigationLink {
                            DetailCarView(viewModel: viewModel, index: index, bookedTrips: $bookedTrips) // Pass bookedTrips binding
                                .navigationBarBackButtonHidden()
                        } label: {
                            CustomCarView(index: index, viewModel: viewModel)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemGray6))
        }
    }
}

#Preview {
    FavoritesView(viewModel: ExploreViewModel(), bookedTrips: .constant([])) 
}
