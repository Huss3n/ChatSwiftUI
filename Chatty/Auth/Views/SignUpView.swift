//
//  SignUpView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct SignUpView: View {
        
    @StateObject private var signUpVM = SignUpViewModel()
    @Binding var isUserSignedIn: Bool
    @Binding var viewChange: Bool
    @State private var signUpErrorMessage = ""
    
    var body: some View {
        ScrollView {
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
                    userProfile
                    username
                    email
                    password
                    
                    Text(signUpErrorMessage)
                        .foregroundStyle(.red)
                        .font(.callout)
                        .frame(height: 10)
                        .opacity(signUpErrorMessage.isEmpty ? 0 : 1)
                    
                    signUpButton
                    signInUser
                }
                
                Spacer()
                
            }
            .padding(5)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isUserSignedIn) {
                MainTab()
            }
        }
        .background(.gray.opacity(0.3))
        .fullScreenCover(isPresented: $signUpVM.showPickerView, content: {
            ImagePicker(selectedImage: $signUpVM.displayPhoto)
        })
    }
}

#Preview {
    NavigationStack {
        SignUpView(isUserSignedIn: .constant(false), viewChange: .constant(true))
    }
}


extension SignUpView {
    
    // MARK: Line through
    private var lineThrough: some View {
        Rectangle()
            .frame(height: 2)
            .frame(maxWidth: .infinity)
            .foregroundStyle(.black.opacity(0.3))
            .padding(.top, 3)
    }
    
    
    // MARK: User profile photo
    private var userProfile: some View {
        Button(action: {
            signUpVM.showPickerView.toggle()
        }, label: {
            VStack {
                if let image = signUpVM.displayPhoto {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 75))
                    
                    
                } else {
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "square.and.pencil")
                            .font(.headline)
                        
                        Image(systemName: "person.fill")
                            .font(.system(size: 60))
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.black)
                    }
                }
            }
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 1.0)
            }
            .padding(.top, 10)
            .padding(4)
        })
    }
    
    
    // MARK: Username
    private var username: some View {
        TextField("Username", text: $signUpVM.displayName)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    
    // MARK: Email
    private var email: some View {
        TextField("Email", text: $signUpVM.email)
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
    
    
    // MARK: Password
    private var password: some View {
        SecureField("Password", text: $signUpVM.password)
            .padding(.leading)
            .font(.headline)
            .foregroundStyle(.primary)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(.white.opacity(0.7))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(5)
    }
    
    
    // MARK: Sign up Button
    private var signUpButton: some View {
        Button(action: {
            Task {
                do {
                    try await signUpVM.signUp()
                    
                    withAnimation(.easeIn) {
                        isUserSignedIn = true
                    }
                }catch InputErrors.emptyfields {
                    signUpErrorMessage = "Please fill in the require fields"
                }
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
    
    
    // MARK: Sign in link
    private var signInUser: some View {
        Text("Have an account? Login")
              .onTapGesture {
                  withAnimation(.easeInOut) {
                      viewChange = true
                  }
              }
        .foregroundStyle(.black)
    }
}
