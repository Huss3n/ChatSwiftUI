//
//  ProfileView.swift
//  Chatty
//
//  Created by Muktar Hussein on 28/12/2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    
    // logout user
    func signOut() async throws {
        do {
            try await AuthManager.shared.signOut()
        }catch {
            print(error.localizedDescription)
        }
    }
    
}

struct ProfileView: View {
    @StateObject private var profileVM = ProfileViewModel()
    @Binding var showProfileView: Bool
    
    
    var body: some View {
        VStack {
            Button("Sign Out") {
                Task {
                    try await profileVM.signOut()
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    NavigationStack {
        ProfileView(showProfileView: .constant(false))
    }
}
