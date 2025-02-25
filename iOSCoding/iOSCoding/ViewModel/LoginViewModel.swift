//
//  LoginViewModel.swift
//  iOSCoding
//
//  Created by Katherine Petalio on 2/25/25.
//

import Combine
import SwiftUI



class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var navigateToHome = false
    
    @AppStorage("isLoggedIn") private var isLoggedIn = false
    @AppStorage("loggedInUsername") private var loggedInUsername = "" // Store username


    private var cancellables = Set<AnyCancellable>()
    
    private var users: [Users] = []

    init() {
        loadUsers()
    }
    
    // Load users from JSON file
    private func loadUsers() {
        if let url = Bundle.main.url(forResource: "users", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decodedData = try JSONDecoder().decode([String: [Users]].self, from: data)
                users = decodedData["users"] ?? []
            } catch {
                print("Error loading users: \(error)")
            }
        }
    }

    func login() {
        guard validateInputs() else { return }
        
        isLoading = true
        errorMessage = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Simulating API call
            if let _ = self.users.first(where: { $0.username == self.username && $0.password == self.password }){
                self.isLoggedIn = true
                self.navigateToHome = true
                self.loggedInUsername = self.username
            } else {
                self.errorMessage = "Invalid username or password!"
            }
            self.isLoading = false
        }
    }
    
    private func validateInputs() -> Bool {
        if username.isEmpty || password.isEmpty {
            errorMessage = "Username and password are required."
            return false
        }
        
        return true
    }
    
   
}
