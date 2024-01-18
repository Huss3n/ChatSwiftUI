//
//  SignUpViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 27/12/2023.
//

import Foundation
import SwiftUI

// MARK: Figure how to save the username for the user in firestore

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var displayPhoto: UIImage? = nil
    @Published var displayName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var showPickerView: Bool = false
    
    // sign up user
    func signUp() async throws {
        // check if fields are empty
        if displayPhoto == nil || displayName.isEmpty || email.isEmpty || password.isEmpty {
            throw InputErrors.emptyfields
        }
        
        do {
            let authUser = try await AuthManager.shared.createAccount(email: email, password: password)
            let displayName = displayName
            saveImage(userDetails: authUser, displayName: displayName)
        }catch {
            throw error
        }
    }
    
    // save user image
    private func saveImage(userDetails: AuthDataResult, displayName: String) {
        StorageManager.shared.uploadImage(image: displayPhoto, userDetails: userDetails, username: displayName)
    }
}


// define input errors erros
enum InputErrors: Error {
    case emptyfields
}
