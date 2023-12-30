//
//  AuthDataResultModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResult {
    let uid: String
    let displayName: String?
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.displayName = user.displayName
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}
