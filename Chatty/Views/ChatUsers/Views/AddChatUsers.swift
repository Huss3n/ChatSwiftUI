//
//  AddChatUsers.swift
//  Chatty
//
//  Created by Muktar Hussein on 08/01/2024.
//

import SwiftUI

struct AddChatUsers: View {
    @StateObject private var addVM = AddUsersVm()
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(addVM.users) { user in
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: user.displayPhoto)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 75))
                            .overlay {
                                RoundedRectangle(cornerRadius: 75)
                                    .stroke(.black, lineWidth: 1.0)
                            }
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text(user.displayName)

                    Spacer()
                }
            }
        }
        .padding()
    }
}

#Preview {
    AddChatUsers()
}
