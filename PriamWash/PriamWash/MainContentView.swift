//
//  MainContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct MainContentView: View {
    
    @EnvironmentObject var session: SessionStore
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "BottomNavColor") ?? .blue

        // Configure per-item colors (this is the key)
        let item = UITabBarItemAppearance()
        item.normal.iconColor = .systemGray3                  // INACTIVE icon
        item.normal.titleTextAttributes = [.foregroundColor: UIColor.systemGray3]
        item.selected.iconColor = .white                      // ACTIVE icon
        item.selected.titleTextAttributes = [.foregroundColor: UIColor.white]

        // Apply to all layouts
        appearance.stackedLayoutAppearance = item
        appearance.inlineLayoutAppearance = item
        appearance.compactInlineLayoutAppearance = item

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance

        // Optional: also set these (some versions still read them)
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .systemGray5
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "envelope.fill")
                }
                .tag(1)
            
            NotificationView()
                .tabItem {
                    Label("Notification", systemImage: "bell.fill")
                }
                .tag(2)
            
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "person.fill")
                }
                .tag(3)
        }
        .accentColor(.white)
    }
}

#Preview {
    MainContentView()
}
