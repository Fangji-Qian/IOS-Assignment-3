//
//  DetailCarView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct DetailCarView: View {
    let index: Int
    @StateObject private var viewModel: ExploreViewModel
    @State private var totalPrice: Int = 0
    @State private var showPaymentView: Bool = false
    @Binding var bookedTrips: [Trip]

    init(viewModel: ExploreViewModel, index: Int, bookedTrips: Binding<[Trip]>) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.index = index
        self._bookedTrips = bookedTrips
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                ImageViewPager(viewModel: viewModel, index: index)
                carInfoSection
                detailedInfoSections
            }
        }
        .scrollIndicators(.hidden)
        .ignoresSafeArea()
        .background(Color(.systemGray6))
        .toolbar(.hidden, for: .tabBar)
        .overlay(bottomBar)
        .sheet(isPresented: $showPaymentView) {
            PaymentView(totalPrice: totalPrice, bookedTrips: $bookedTrips, carName: viewModel.cars[index].carName)
        }
    }

    private var carInfoSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(viewModel.cars[index].carName)
                .font(.headline)
                .fontWeight(.bold)
            HStack(spacing: 2) {
                Text(String(format: "%.1f", viewModel.cars[index].rating))
                Image(systemName: "star.fill")
                    .foregroundStyle(.orange)
            }
        }
        .padding(.horizontal)
    }

    private var detailedInfoSections: some View {
        VStack {
            Divider()
            TripDateView(pricePerDay: viewModel.cars[index].pricePerDay, totalPrice: $totalPrice)
            Divider()
            LocationView(title: "Pick & Return", message: "Sydney")
            CancellationView(title: "Cancellation Policy", message: "Free")
            Divider()
            CarInfoView(title: "Included Distance", message: viewModel.cars[index].maxDistance == nil ? "Unlimited" : "\(viewModel.cars[index].maxDistance ?? 0) km")
            Divider()
            InsuranceInfoView(title: "Insurance", message: viewModel.cars[index].insurance)
            Divider()
            CarBasicsView(title: "Car Basics", numberOfSeats: viewModel.cars[index].numberOfSeats, numberOfDoors: viewModel.cars[index].numberOfDoors, gasType: viewModel.cars[index].GasType)
            Divider()
            CarInfoView(title: "Description", message: viewModel.cars[index].description)
            Divider()
            HostView(title: "published by", message: viewModel.cars[index].hostName, imageName: viewModel.cars[index].hostImageName, joinDate: viewModel.cars[index].hostJoinDate)
            Spacer().frame(height: 100)
        }
    }

    private var bottomBar: some View {
        VStack {
            Spacer()
            ZStack {
                Color.white
                    .frame(width: UIScreen.main.bounds.width, height: 120)
                priceButton
            }
        }
        .ignoresSafeArea()
    }

    private var priceButton: some View {
        HStack {
            priceDetails
            Spacer()
            continueButton
        }
        .padding(.horizontal, 10)
        .padding(.vertical)
    }

    private var priceDetails: some View {
        VStack {
            Text("\(viewModel.cars[index].pricePerDay)$ per day")
                .font(.headline)
                .fontWeight(.semibold)
            Text("\(totalPrice)$ total")
                .font(.subheadline)
                .underline()
        }
    }

    private var continueButton: some View {
        Button(action: {
            showPaymentView.toggle()
        }) {
            Text("Continue")
                .foregroundColor(.white)
                .frame(width: 100, height: 40)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    DetailCarView(viewModel: ExploreViewModel(), index: 0, bookedTrips: .constant([]))
}

struct CarInfoView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            Text(message)
        }
        .padding(.horizontal)
    }
}

struct LocationView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack(spacing: 10) {
                Image(systemName: "mappin.and.ellipse.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                Text(message)
            }
        }
        .padding(.horizontal)
    }
}

struct CancellationView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Image(systemName: "hand.thumbsup")
                VStack(alignment: .leading) {
                    Text(message)
                    Text("Full refund before: ")
                        .font(.footnote)
                        .foregroundStyle(.gray) +
                    Text(Date(),style: .date)
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct InsuranceInfoView: View {
    var title: String
    var message: String
    @State private var showInsuranceSheet: Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Text("Insurance via "+message)
                Spacer()
                Button(action: {
                    showInsuranceSheet.toggle()
                }, label: {
                    Text("Read more")
                        .font(.headline)
                        .fontWeight(.bold)
                })
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $showInsuranceSheet) {
            MyInsuranceView()
        }
    }
}

struct CarBasicsView: View {
    var title: String
    var numberOfSeats: Int
    var numberOfDoors: Int
    var gasType: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            ScrollView(.horizontal) {
                HStack(spacing: 15) {
                    VStack {
                        Image(systemName: "carseat.left.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("\(numberOfSeats) seats")
                    }
                    VStack {
                        Image(systemName: "car.window.right")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("\(numberOfDoors) doors")
                    }
                    VStack {
                        Image(systemName: "fuelpump")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text(gasType)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal)
    }
}

struct HostView: View {
    var title: String
    var message: String
    var imageName: String
    var joinDate: String
    var body: some View {
        VStack(alignment: .leading,spacing: 15) {
            Text(title)
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    Text(message)
                        .fontWeight(.bold)
                    Text("Joined \(joinDate)")
                        .font(.subheadline)
                }
            }
        }
        .padding(.horizontal)
    }
}
