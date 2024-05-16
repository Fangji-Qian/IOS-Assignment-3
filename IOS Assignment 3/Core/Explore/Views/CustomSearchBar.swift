//
//  CustomSearchBar.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
                .foregroundStyle(.white)
            TextField("Search a car...", text: $searchText)
                .font(.footnote)
                .foregroundStyle(.black)
            Spacer()
        }
        .frame(height: 60)
        .background(Capsule().fill(Color(.systemGray5)))
        .padding(.horizontal)
    }
}

#Preview {
    CustomSearchBar(searchText: .constant(""))
}
