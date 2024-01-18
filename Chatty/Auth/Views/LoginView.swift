//
//  LoginView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginVM = LoginViewModel()
    @Binding var isUserSignedIn: Bool
    @Binding var viewChange: Bool
    @State private var loginErrorMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 9) {
            
            Image("chatty")
                .padding(.leading)
            
            Text("Swift Talk")
                .font(.title)
                .fontWeight(.heavy)
                .padding(.leading)
                
            
            Text("Your Express Lane to Engaging Conversations!")
                .font(.caption)
                .fontDesign(.monospaced)
                .padding(.leading)
            
            VStack {
                email
                password
                
                Text(loginErrorMessage)
                    .foregroundStyle(.red)
                    .font(.callout)
                    .frame(height: 10)
                    .opacity(loginErrorMessage.isEmpty ? 0 : 1)
                
                loginButton
                signUpUser
            }
            Spacer()
            
        }
        .padding(5)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.3))
    }
}

#Preview {
    NavigationStack {
        LoginView(isUserSignedIn: .constant(false), viewChange: .constant(true))
    }
}


extension LoginView {
    
    // MARK: Line through
    private var lineThrough: some View {
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black.opacity(0.3))
            .padding(.top, 3)
    }
    
    
    // MARK: Email
    private var email: some View {
        TextField("Email", text: $loginVM.email)
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
            .padding(.top, 20)
    }
    
    
    // MARK: Password
    private var password: some View {
        SecureField("Password", text: $loginVM.password)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    
    // MARK: login Button
    private var loginButton: some View {
        Button(action: {
            Task {
                do {
                    try await loginVM.login()
                    withAnimation(.spring) {
                        isUserSignedIn = true
                    }
                }catch InputErrors.emptyfields {
                    loginErrorMessage = "Fill in the required fields"
                }
            }
        }, label: {
            Text("Login")
                .font(.headline)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .padding()
        })
    }
    
    
    // MARK: Sign up User link
    private var signUpUser: some View {
        Text("Don't have an account? Sign Up")
            .onTapGesture {
                withAnimation(.easeInOut) {
                    viewChange = false
                }
            }
            .foregroundStyle(.black)
    }
}
