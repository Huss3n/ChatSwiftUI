//
//  UserViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import Foundation
import FirebaseAuth

// handles all the authentication
@MainActor
final class AuthManager {
    
    static let shared = AuthManager()
    
    private init() { }

    // MARK: Logout User
    func signOut() throws {
       try Auth.auth().signOut()
    }
    
    // MARK: Get authenticated user
    func getCurrentUser() throws -> AuthDataResult {
        guard let currentUser = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        return AuthDataResult(user: currentUser)
    }
}

extension AuthManager {
    // MARK: Authentication functions
    
    // MARK: Create account function
    
    func createAccount(email: String, password: String) async throws -> AuthDataResult {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        print("User created \(authDataResult.user.uid) with email \(authDataResult.user.email ?? "")")
        return AuthDataResult(user: authDataResult.user)
    }
    
    // MARK: Login User function
    func loginUser(email: String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    // MARK: Update Email function
    
    
    
    // MARK: Update Password function
    
    
    
    // MARK: Delete Account function
    
    
}

