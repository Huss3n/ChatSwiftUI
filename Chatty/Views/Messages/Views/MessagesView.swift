//
//  Messages.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import SwiftUI

struct MessagesView: View {
    @StateObject private var messagesVM = MessagesViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { _ in
                    MessageRow()
                }
            }
            .navigationTitle("Chats")
        }
    }
}

#Preview {
    NavigationStack {
        MessagesView()
    }
}

