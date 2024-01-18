//
//  Messages.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import SwiftUI

struct MessagesView: View {
    @StateObject private var messagesVM = MessagesViewModel()
    @State private var addChat: Bool = false
    
    var body: some View {
        ScrollView {
            NavigationStack {
                VStack {
                    ForEach(0..<20) { _ in
                        MessageRow()
                    }
                }
                .navigationTitle("Chats")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Image(systemName: "square.and.pencil")
                            .onTapGesture {
                                addChat.toggle()
                            }
                    }
                }
                .sheet(isPresented: $addChat, content: {
                    AddChatUsers()
                })
            }
        }
    }
}

#Preview {
    NavigationStack {
        MessagesView()
    }
}

