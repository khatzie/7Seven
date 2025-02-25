//
//  HomeViewModel.swift
//  iOSCoding
//
//  Created by Katherine Petalio on 2/25/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var username: String = "7seven" // Sample data
    @Published var isLoggedOut: Bool = false     // Controls navigation back to LoginView

    func logout() {
        // Perform any cleanup (e.g., clear session, remove tokens, etc.)
        isLoggedOut = true
    }
}
