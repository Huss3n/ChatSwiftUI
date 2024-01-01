//
//  MainTab.swift
//  Chatty
//
//  Created by Muktar Hussein on 31/12/2023.
//

import SwiftUI

struct MainTab: View {
    @State private var selectedTab: TabItems = .message
    
    var body: some View {
        TabComponents(selectedTab: $selectedTab)
    }
}

#Preview {
    MainTab()
}
