//
//  RootView.swift
//  Chatty
//
//  Created by Muktar Hussein on 25/12/2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var authModel: AuthModel = AuthModel()
    
    var body: some View {
        VStack {
                SignUpView()
                    .environmentObject(authModel)
        }
    }
}

#Preview {
    NavigationStack {
        RootView()
    }
}
