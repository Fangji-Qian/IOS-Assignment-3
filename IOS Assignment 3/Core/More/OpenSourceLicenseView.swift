//
//  OpenSourceLicenseView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 16/5/2024.
//

import SwiftUI

struct OpenSourceLicenseView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Open Source Licenses")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("UTS RENTCAR uses several open-source projects to provide the best possible experience. Below is a list of the open-source projects we use along with their licenses:")
                    .font(.body)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("1. Project Name")
                        .font(.headline)
                    Text("License: uts")
                    Text("Description: A brief description of what this project does.")
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .navigationTitle("Open Source License")
        .background(Color(.systemGray6))
    }
}

struct OpenSourceLicenseView_Previews: PreviewProvider {
    static var previews: some View {
        OpenSourceLicenseView()
    }
}
