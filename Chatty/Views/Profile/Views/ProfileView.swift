//
//  ProfileView.swift
//  Chatty
//
//  Created by Muktar Hussein on 28/12/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var profileVM = ProfileViewModel()
    @Binding var isUserSignedIn: Bool
    @State private var logoutPopUp: Bool = false
    
    var body: some View {
        VStack {
            
            VStack {
                userDisplayPhoto
                userDetails
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .padding()
            .shadow(radius: 10)
            
            
            profileSettings
        }
        .navigationTitle("Profile")
        .confirmationDialog("Logout", isPresented: $logoutPopUp) {
            Button("Logout", role: .destructive, action: {
                Task {
                    try AuthManager.shared.signOut()
                    withAnimation(.spring) {
                        isUserSignedIn = false
                    }
                }
            })
            Button("Cancel", role: .cancel, action: {})
        } message: {
            Text("Are you sure you want to logout?")
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(isUserSignedIn: .constant(true))
    }
}


// MARK: Fetched user details
extension ProfileView {
    
    // MARK: User profile photo
    private var userDisplayPhoto: some View {
        Group {
            if let url = URL(string: profileVM.displayPhoto) {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                            .clipShape(RoundedRectangle(cornerRadius: 75))
                            .overlay {
                                RoundedRectangle(cornerRadius: 75)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    
                    Image(systemName: "square.and.pencil")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .offset(x: 10.0, y: 10)
                }

            }
        }
    }
    
    // MARK: User name and email
    private var userDetails: some View {
        VStack {
        
            
            Text(profileVM.displayName)
                .font(.title2)
                .fontWeight(.semibold)
            
            
            Text(profileVM.email)
                .font(.callout)
                .foregroundStyle(.gray)
            
            
        }
        .padding(.top, 20)
    }
}

// MARK: User settings list
extension ProfileView {
    
    private var profileSettings: some View {
        List {
            Section("User Profile") {
                
                NavigationLink {
                    Text("Change Username")
                } label: {
                    HStack {
                        Image(systemName: "person")
                        Text("Update Username")
                    }
                }
                
                NavigationLink {
                    Text("Change password")
                } label: {
                    HStack {
                        Image(systemName: "lock.app.dashed")
                        Text("Change Password")
                    }
                }

                
                NavigationLink {
                    Text("Update Email")
                } label: {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Update Email")
                    }
                }

            }
            
            accountSettings
        }
    }
    
    private var accountSettings: some View {
        Section("Account settings") {
            Button("Logout", role: .destructive) {
                //logout Account
                logoutPopUp.toggle()
            }
            Button("Delete Account", role: .destructive) {
                //delete Account
            }
        }
    }
}
