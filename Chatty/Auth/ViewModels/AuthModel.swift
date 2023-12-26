//
//  UserViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let username: String?
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.username = user.displayName
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
    
    
    
}


// handles all the authentication

class AuthModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    
    // signup user
    @discardableResult
    func createAccount() async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        print("User created \(authDataResult.user.uid) with email \(authDataResult.user.email ?? "")")
        return AuthDataResultModel(user: authDataResult.user)
    }
}
