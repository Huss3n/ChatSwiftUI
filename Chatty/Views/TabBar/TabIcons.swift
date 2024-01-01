//
//  TabView.swift
//  Chatty
//
//  Created by Muktar Hussein on 30/12/2023.
//

import SwiftUI

enum TabItems: String, CaseIterable {
    case message
    case magnifyingglass
    case gear
    case person
}

struct TabComponents: View {
    @Binding var selectedTab: TabItems
    
    private var fillImage: String {
        selectedTab.rawValue + ".fill" // <- message.fill
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(TabItems.allCases, id:\.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue )
                        .font(.system(size: selectedTab == tab ? 20 : 18))
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundStyle(selectedTab == tab ? .red : .gray)
                        .offset(x: 0, y: selectedTab == tab ? -5 : 0)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding()
        }
    }
}

#Preview {
    TabComponents(selectedTab: .constant(.message))
}
