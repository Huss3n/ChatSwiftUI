//
//  ImageManager.swift
//  Chatty
//
//  Created by Muktar Hussein on 28/12/2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseAuth

final class StorageManager {
    
    static let shared = StorageManager()
    
    // upload image to firebase
    func uploadImage(image: UIImage?, userDetails: AuthDataResult, username: String) {
        // 1. compress the image
        if let image = image,
           let imageData = image.jpegData(compressionQuality: 0.5) {
            // 2. initialize a storage
            let storage = Storage.storage()
            // 3. get the storage ref
            let storageRef = storage.reference().child("userProfiles").child(userDetails.uid)
            
            
            storageRef.putData(imageData) { _, error in
                if let error = error {
                    print("Error on storage ref putData: \(error)")
                    return
                }
                
                // get the download url of the photo
                storageRef.downloadURL { url, error in
                    guard let downloadURL = url, error == nil else {
                        print("error: \(error?.localizedDescription ?? "optional handling")")
                        return
                    }
                    
                    self.uploadToFirebase(userDetails: userDetails, downloadURL: downloadURL.absoluteString, username: username)
                    
                }
            }
        }
    }
    
    
    private func uploadToFirebase(userDetails: AuthDataResult, downloadURL: String, username: String) {
        // Save user details, including the download URL, to Firestore
        let db = Firestore.firestore()
        let userRef = db.collection("users").document(userDetails.uid)
        
        userRef.setData(
            /**
             let uid: String
             let username: String?
             let email: String?
             */
            ["userID" : userDetails.uid,
             "displayName": username,
             "userEmail" : userDetails.email ?? "optional Email",
             "displayPhoto" : downloadURL
            ]
        ) { error in
            if let error = error {
                print("Error saving user details to Firestore: \(error.localizedDescription)")
            }else {
                print("User signed up successfully!")
            }
        }
    }
}
