//
//  SignInViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 27/12/2023.
//

import Foundation


@MainActor
final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    // login
    func login() async throws {
        guard !email.isEmpty && !password.isEmpty else {
            throw InputErrors.emptyfields
          }

        do {
            try await AuthManager.shared.loginUser(email: email, password: password)
        } catch  {
            throw error
        }
    }
}
