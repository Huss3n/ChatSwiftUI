//
//  MessageRow.swift
//  Chatty
//
//  Created by Muktar Hussein on 29/12/2023.
//

import SwiftUI

struct MessageRow: View {
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "person.fill")
                .frame(width: 60, height: 60)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(.black, lineWidth: 1.0)
                }
            
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.headline)
                
                Text("Message sent to user")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            Text("22d")
                .font(.headline)
        }
        .padding()
    }
}

struct MessageRow_Preview: PreviewProvider {
    static var previews: some View {
        MessageRow()
    }
}
