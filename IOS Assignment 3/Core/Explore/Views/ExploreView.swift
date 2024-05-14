//
//  ExploreView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

//
//  ExploreView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var viewModel: ExploreViewModel
    @State private var searchText: String = ""
    
    init(viewModel: ExploreViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack {
                    GradientColorBackground()
                    
                    VStack {
                        Spacer().frame(height: 100)
                        CustomSearchBar(searchText: $searchText)
                            .padding(.horizontal)
                        Spacer().frame(height: 40)
                        if searchText.isEmpty {
                            PopularBrandsView(viewModel: viewModel)
                                .padding(.horizontal)
                        } else {
                            TopCarsView(cars: filteredCars)
                                .padding(.horizontal)
                        }
                        Spacer()
                    }
                }
            }
            .modifier(NavigationModifier())
        }
    }
    
    private var filteredCars: [Car] {
        if searchText.isEmpty {
            return viewModel.cars
        } else {
            return viewModel.cars.filter { $0.carName.lowercased().contains(searchText.lowercased()) }
        }
    }
}

#Preview {
    ExploreView(viewModel: ExploreViewModel())
}

struct GradientColorBackground: View {
    var body: some View {
        VStack {
            LinearGradient(colors: [.red, .orange], startPoint: .top, endPoint: .bottom)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
