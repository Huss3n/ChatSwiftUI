//
//  LoginView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authModel: AuthModel
    
    var body: some View {
        VStack(spacing: 0) {
            lineThrough
            
            email
            password
            loginButton
            signUpUser
            
            Spacer()
            
        }
        .padding(5)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [.blue, .green, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Log In")
                    .font(.title.bold())
                    .padding(.leading, 4)
            }
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
            .environmentObject(AuthModel())
    }
}


extension LoginView {
    private var lineThrough: some View {
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black.opacity(0.3))
            .padding(.top, 3)
    }
    
    
    private var email: some View {
        TextField("Email", text: $authModel.email)
            .keyboardType(.emailAddress)
            .textInputAutocapitalization(.none)
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
    
    private var loginButton: some View {
        Button(action: {
            
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
    
    private var signUpUser: some View {
        NavigationLink("Don't have an account? Sign Up") {
            SignUpView()
                .environmentObject(AuthModel())
                .navigationBarBackButtonHidden(true)
        }
        .foregroundStyle(.white)
    }
}
