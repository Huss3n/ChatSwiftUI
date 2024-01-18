//
//  MainTab.swift
//  Chatty
//
//  Created by Muktar Hussein on 31/12/2023.
//
//
import SwiftUI

struct MainTab: View {
    @AppStorage("isUserSignedIn") var isUserSignedIn: Bool = false
    @State private var loginSignUp: Bool = true
    
    var body: some View {
        ZStack {
            if isUserSignedIn {
                TabView {
                    MessagesView()
                        .tabItem {
                            Image(systemName: "message")
                        }
                    
                    ProfileView(isUserSignedIn: $isUserSignedIn)
                        .navigationTitle("Profile")
                        .tabItem {
                            Image(systemName: "person")
                        }
                }
                
            } else {
                ZStack {
                    if loginSignUp {
                        LoginView(isUserSignedIn: $isUserSignedIn, viewChange: $loginSignUp)
                    }else {
                        SignUpView(isUserSignedIn: $isUserSignedIn, viewChange: $loginSignUp)
                    }
                }
            }
           
        }
    }
}

#Preview {
    NavigationStack {
        MainTab()
    }
}
