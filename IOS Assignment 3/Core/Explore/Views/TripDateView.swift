//
//  TripDateView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct TripDateView: View {
    var currentYear = Calendar.current.component(.year, from: Date())
    var currentMonth = Calendar.current.component(.month, from: Date())
    var currentDay = Calendar.current.component(.day, from: Date())
    var returnDay = Calendar.current.component(.day, from: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date())
    
    @State private var selectedDates: Set<DateComponents>
    @State private var isDatePickerPresented: Bool = false
    @Binding var totalPrice: Int
    var pricePerDay: Int
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date()
    
    init(pricePerDay: Int, totalPrice: Binding<Int>) {
        self.pricePerDay = pricePerDay
        self._totalPrice = totalPrice
        self._selectedDates = State(initialValue: [
            .init(timeZone: .gmt, year: currentYear, month: currentMonth, day: currentDay, hour: 10),
            .init(timeZone: .gmt, year: 2024, month: 12, day: returnDay, hour: 10)
        ])
    }
    
    func formattedDate(addedDays: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMM "
        return dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: addedDays, to: Date()) ?? Date())
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Trip Dates")
                .foregroundStyle(Color(.darkGray))
                .font(.headline)
                .fontWeight(.semibold)
            dateSelectionView
        }
        .padding(.horizontal)
        .popover(isPresented: $isDatePickerPresented, arrowEdge: .top) {
            DatePickerPopover(selectedDates: $selectedDates, totalPrice: $totalPrice, pricePerDay: pricePerDay, startDate: $startDate, endDate: $endDate)
        }
    }
    
    private var dateSelectionView: some View {
        HStack(spacing: 10) {
            Image(systemName: "calendar.circle")
                .resizable()
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(startDate, style: .date) + Text(", \(startDate, style: .time)")
                Text(endDate, style: .date) + Text(", \(endDate, style: .time)")
            }
            Spacer()
            Button {
                isDatePickerPresented.toggle()
            } label: {
                Text("Change")
                    .font(.headline)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    TripDateView(pricePerDay: 50, totalPrice: .constant(100))
}
