//
//  MessagesViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

@MainActor
final class MessagesViewModel: ObservableObject {
    @Published var showLogoutConfirmation: Bool = false
    
    
    // logout user
    func signOut() async throws {
        do {
            try AuthManager.shared.signOut()
        }catch {
            print(error.localizedDescription)
        }
    }
}



