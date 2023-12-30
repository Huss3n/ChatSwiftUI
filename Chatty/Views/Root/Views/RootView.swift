//
//  RootView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct RootView: View {
    
    @AppStorage("isUserSignedIn") var isUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            if isUserSignedIn {
                Messages()
            }else {
                SignUpView(isUserSignedIn: $isUserSignedIn)
            }
        }
        .onAppear {
            isUserSignedIn = RootViewModel.shared.checkUserSignIn()
        }
    }
}

#Preview {
    NavigationStack {
        RootView()
    }
}
