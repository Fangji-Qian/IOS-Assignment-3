//
//  TripsView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

enum TabSelection: String, CaseIterable {
    case booked = "Booked"
    case history = "History"
}

struct TripsView: View {
    @Binding var bookedTrips: [Trip]
    @State private var tabSelection: TabSelection = .booked

    var body: some View {
        NavigationStack {
            VStack {
                Picker("Tabs", selection: $tabSelection) {
                    ForEach(TabSelection.allCases, id: \.self) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                switch tabSelection {
                case .booked:
                    if bookedTrips.isEmpty {
                        TripsEmptyView(imageName: "car", title: "No trips")
                    } else {
                        List(bookedTrips) { trip in
                            Text(trip.carName)
                        }
                    }
                case .history:
                    TripsEmptyView(imageName: "car", title: "No previous trips")
                }
                
                Spacer()
            }
            .background(Color(.systemGray6))
            .navigationTitle("Trips")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TripsView_Previews: PreviewProvider {
    static var previews: some View {
        TripsView(bookedTrips: .constant([])) 
    }
}


struct TripsEmptyView: View {
    var imageName: String
    var title: String

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .font(.largeTitle)
            Text(title)
                .font(.title)
        }
    }
}
