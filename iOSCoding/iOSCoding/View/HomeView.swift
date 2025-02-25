//
//  HomeView.swift
//  iOSCoding
//
//  Created by Katherine Petalio on 2/25/25.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn = false  // Track login state
    @AppStorage("loggedInUsername") private var loggedInUsername = ""

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Image("77logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 100)
                    .padding(.top, 10)
                
                Text("Welcome, \(loggedInUsername)!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                Button(action: {
                    isLoggedIn = false  // Logout and go back to LoginView
                }) {
                    Text("Logout")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    HomeView()
}
