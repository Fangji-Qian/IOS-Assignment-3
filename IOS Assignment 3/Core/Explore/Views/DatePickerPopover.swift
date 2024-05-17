//
//  DatePickerPopover.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 17/5/2024.
//

import SwiftUI

struct DatePickerPopover: View {
    @Binding var selectedDates: Set<DateComponents>
    @Binding var totalPrice: Int
    var pricePerDay: Int
    @Binding var startDate: Date
    @Binding var endDate: Date
    @State private var start: Double = 10 {
        didSet {
            updateEndDate()
        }
    }
    @State private var end: Double = 10 {
        didSet {
            updateEndDate()
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                handleIndicator
                dateHeaderView
                Divider().padding(.bottom)
                datePicker
                Divider().padding(.top)
                sliders
                saveButton
                Spacer()
            }
            .padding(.vertical)
        }
        .scrollIndicators(.hidden)
        .onChange(of: selectedDates) { _ in
            updateTotalPrice()
        }
    }
    
    private var handleIndicator: some View {
        Rectangle()
            .frame(width: 60, height: 5)
            .foregroundStyle(Color(.systemGray5))
            .padding(.vertical)
    }
    
    private var dateHeaderView: some View {
        return HStack {
            VStack {
                Text(startDate, style: .date)
                    .fontWeight(.bold)
                Text("\(Int(start)):00")
            }
            Spacer()
            Image(systemName: "arrowshape.forward.fill")
            Spacer()
            VStack {
                Text(endDate, style: .date)
                    .fontWeight(.bold)
                Text("\(Int(end)):00")
            }
        }
        .font(.footnote)
        .padding(.horizontal)
    }
    
    private var datePicker: some View {
        MultiDatePicker("Select Dates", selection: $selectedDates, in: Date()...)
            .frame(height: 300)
            .padding(.horizontal)
            .onChange(of: selectedDates) { _ in
                connectSelectedDates()
            }
    }
    
    private var sliders: some View {
        VStack(spacing: 15) {
            slider(label: "Start: \(Int(start))", value: $start)
            slider(label: "End: \(Int(end))", value: $end)
        }
        .padding(.horizontal)
    }
    
    private func slider(label: String, value: Binding<Double>) -> some View {
        HStack {
            Text(label)
                .font(.footnote)
                .foregroundStyle(.gray)
            Slider(value: value, in: 0...24, step: 1)
        }
    }
    
    private var saveButton: some View {
        Button(action: {
            // Add your save action here
        }) {
            Text("Save")
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width - 35, height: 45)
                .background(Color.blue)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .padding(.top)
    }
    
    private func updateTotalPrice() {
        let days = selectedDates.count - 1
        totalPrice = days * pricePerDay
    }
    
    private func updateEndDate() {
        let calendar = Calendar.current
        let duration = end - start
        if duration < 0 {
            endDate = calendar.date(byAdding: .day, value: 1, to: startDate) ?? Date()
            endDate = calendar.date(bySettingHour: Int(end), minute: 0, second: 0, of: endDate) ?? Date()
        } else {
            endDate = calendar.date(bySettingHour: Int(end), minute: 0, second: 0, of: startDate) ?? Date()
        }
    }

    private func connectSelectedDates() {
        guard selectedDates.count >= 2 else { return }
        let sortedDates = selectedDates.sorted { ($0.date ?? Date()) < ($1.date ?? Date()) }
        selectedDates = Set(Calendar.current.range(of: .day, in: .month, for: sortedDates.first!.date!)!.map { date -> DateComponents in
            var components = DateComponents()
            components.day = date
            components.month = sortedDates.first!.month
            components.year = sortedDates.first!.year
            return components
        }.filter { $0.date! <= sortedDates.last!.date! })
    }
}

#Preview {
    DatePickerPopover(selectedDates: .constant([DateComponents()]), totalPrice: .constant(100), pricePerDay: 50, startDate: .constant(Date()), endDate: .constant(Date()))
}
