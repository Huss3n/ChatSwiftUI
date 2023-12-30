//
//  Messages.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import SwiftUI

struct Messages: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { _ in
                    MessageRow()
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "pen")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        Messages()
    }
}
