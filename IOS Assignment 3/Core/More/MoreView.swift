//
//  MoreView.swift
//  IOS Assignment 3
//
//  Created by 李昌霖 on 13/5/2024.
//

import SwiftUI

struct MoreView: View {
    var parametersOptions: [(String, Image)] = [
        ("Account", Image(systemName: "person")),
        ("How CarRentalApp works", Image(systemName: "key.horizontal")),
        ("Contact Support", Image(systemName: "person.wave.2")),
        ("Legal", Image(systemName: "newspaper")),
        ("Open source license", Image(systemName: "newspaper"))
    ]
    @State private var showAlert: Bool = false
    @State private var displayEditProfileView: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    Button(action: {
                        displayEditProfileView.toggle()
                    }, label: {
                        HeaderView()
                    })
                    
                    VStack(spacing: 25) {
                        ForEach(parametersOptions, id: \.0) { option in
                            HStack {
                                option.1
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text(option.0)
                                    .padding(.leading, 10)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                        }
                    }
                    
                    Divider().padding(.vertical, 20)
                    
                    VStack(spacing: 25) {
                        Button(action: {
                            showAlert.toggle()
                        }, label: {
                            Text("Logout")
                                .fontWeight(.semibold)
                                .foregroundStyle(.red)
                        })
                        
                        Text("version 1.0")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 20)
            }
            .alert("Confirm again", isPresented: $showAlert, actions: {
                Button("Logout") { }
                Button("Cancel", role: .cancel) {}
            })
            .background(Color(.systemGray6))
            .ignoresSafeArea()
            .fullScreenCover(isPresented: $displayEditProfileView, content: {
                EditProfileView() 
            })
        }
    }
}

// prview
struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 15) {
                Image("michael_scott")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                VStack(alignment: .leading) {
                    Text("UTS_stu")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text("View and edit your profile")
                        .font(.caption)
                        .foregroundStyle(.blue)
                }
                Spacer()
            }
            .padding()
            Divider()
        }
    }
}
