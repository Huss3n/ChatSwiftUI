//
//  ProfileViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift



@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var displayName = ""
    @Published var displayPhoto = ""
    @Published var email = ""
    
    
    init() {
        Task {
            try await getUserDetails()
        }
    }
    
    
    private func getUserDetails() async throws {
        do {
            let authenticatedUser = try AuthManager.shared.getCurrentUser()
            let uid = authenticatedUser.uid
            
            //            self.userName = uid
            
            // getting user details from the firestore
            let documentSnapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            guard let data = documentSnapshot.data() else {
                print("No data was found in firestore")
                return
            }
            self.displayName = data["displayName"] as? String ?? "not retrieved"
            self.displayPhoto = data["displayPhoto"] as? String ?? "no url"
            self.email = data["userEmail"] as? String ?? "no email retrieved"
            print(data)
            
        }catch {
            print("Error fetching current user")
        }
    }
    
}


// MARK: Use in profile view
/**
 let urlString = messagesVM.displayPhoto
 if let url = URL(string: urlString) {
 HStack {
 AsyncImage(url: url) { image in
 image
 .resizable()
 .scaledToFill()
 .frame(width: 80, height: 80)
 .overlay {
 RoundedRectangle(cornerRadius: 40)
 .stroke(.black, lineWidth: 1.0)
 }
 } placeholder: {
 ProgressView()
 }
 
 Text(messagesVM.displayName)
 }
 .frame(width: 100, height: 100)
 }
 */
