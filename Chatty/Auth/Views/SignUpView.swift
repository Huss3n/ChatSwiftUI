//
//  SignUpView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authModel: AuthModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                lineThrough
                
                userProfile
                username
                email
                password
                signUpButton
                signInUser
                
                Spacer()
                
            }
            .padding(5)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Sign Up")
                        .font(.title.bold())
                        .padding(.leading, 4)
                }
            }
        }
        .background(
            LinearGradient(colors: [.blue, .green, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

#Preview {
    NavigationStack {
        SignUpView()
            .environmentObject(AuthModel())
    }
}


extension SignUpView {
    private var lineThrough: some View {
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black.opacity(0.3))
            .padding(.top, 3)
    }
    
    private var userProfile: some View {
        Button(action: {
            
        }, label: {
            Image(systemName: "person.fill")
                .font(.system(size: 60))
                .frame(width: 100, height: 100)
                .overlay {
                    Circle()
                        .foregroundStyle(.clear)
                }
                .foregroundStyle(.black)
        })
    }
    
    private var username: some View {
        TextField("Username", text: $authModel.username)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    private var email: some View {
        TextField("Email", text: $authModel.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.never)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    
    private var password: some View {
        SecureField("Password", text: $authModel.password)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    
    private var signUpButton: some View {
        Button(action: {
            Task {
                authModel.createAccount
            }
        }, label: {
            Text("Sign Up")
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
        })
    }
    
    private var signInUser: some View {
        NavigationLink("Have an account? Login") {
            LoginView()
                .environmentObject(AuthModel())
                .navigationBarBackButtonHidden(true)
        }
        .foregroundStyle(.white)
    }
}
