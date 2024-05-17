//
//  MainTabbarView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct MainTabbarView: View {
    @StateObject private var viewModel = ExploreViewModel()
    @State private var bookedTrips: [Trip] = [] 
    
    var body: some View {
        NavigationStack {
            TabView {
                ExploreView(viewModel: viewModel, bookedTrips: $bookedTrips)
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Explore")
                        }
                    }
                
                FavoritesView(viewModel: viewModel, bookedTrips: $bookedTrips) 
                    .tabItem {
                        VStack {
                            Image(systemName: "heart")
                            Text("Favorite")
                        }
                    }
                
                TripsView(bookedTrips: $bookedTrips)
                    .tabItem {
                        VStack {
                            Image(systemName: "car")
                            Text("Travel")
                        }
                    }
                
                InboxView()
                    .tabItem {
                        VStack {
                            Image(systemName: "message")
                            Text("Message")
                        }
                    }
                
                MoreView()
                    .tabItem {
                        VStack {
                            Image(systemName: "ellipsis")
                            Text("More")
                        }
                    }
            }
        }
    }
}

#Preview {
    MainTabbarView()
}
