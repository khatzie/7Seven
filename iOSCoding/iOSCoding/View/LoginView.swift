//
//  LoginView.swift
//  iOSCoding
//
//  Created by Katherine Petalio on 2/25/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @AppStorage("isLoggedIn") private var isLoggedIn = false // Retrieve stored login state
    @State private var isPasswordVisible = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("77logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 100)
                    .padding(.top, 10)
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                HStack {
                    TextField("Username", text: $loginViewModel.username)
                        .autocapitalization(.none)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                HStack {
                    if isPasswordVisible {
                        TextField("Password", text: $loginViewModel.password)
                    } else {
                        SecureField("Password", text: $loginViewModel.password)
                    }
                    Button(action: {
                        isPasswordVisible.toggle()  // Toggle visibility
                    })
                    {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal)
                
                if !loginViewModel.errorMessage.isEmpty {
                    Text(loginViewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                
                Button(action: loginViewModel.login) {
                    if loginViewModel.isLoading {
                        ProgressView()
                    } else {
                        Text("Login")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .disabled(loginViewModel.isLoading)
                .padding(.horizontal)
            }
            .padding()
            .navigationDestination(isPresented: .constant(isLoggedIn))
            {
                HomeView()
            }
        }
    }
}

#Preview {
    LoginView()
}
