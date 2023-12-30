//
//  RootViewModel.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import Foundation
import SwiftUI


@MainActor
final class RootViewModel {

    static let shared = RootViewModel()
  
    func checkUserSignIn() -> Bool {
        let authenticatedUser = try? AuthManager.shared.getCurrentUser()
        if authenticatedUser?.uid != nil {
            return true
        }
        return false
    }
}
