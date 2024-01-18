//
//  AddUsersVm.swift
//  Chatty
//
//  Created by Muktar Hussein on 08/01/2024.
//

import Foundation
import Firebase
import FirebaseFirestore


struct ChatUser: Identifiable {
    var id: String
    var userEmail: String
    var displayName: String
    var displayPhoto: String
}


@MainActor
class AddUsersVm: ObservableObject {
    @Published var users: [ChatUser] = []
    
    // initialite the db
    private var db = Firestore.firestore()
    
    
    
    init () {
        fetchUsers()
    }
    
    // func to fetch users from firebase
    private func fetchUsers() {
        db.collection("users").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error fetching users \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                return
            }
            
            self.users = documents.map({ queryDocumentSnapshot in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let userEmail = data["userEmail"] as? String ?? "No email fetched"
                let displayName = data["displayName"] as? String ?? "No display name fetched"
                let displayPhoto = data["displayPhoto"] as? String ?? "No email url fetched"
                
                return ChatUser(id: id, userEmail: userEmail, displayName: displayName, displayPhoto: displayPhoto)
            })
        }
    }
}
