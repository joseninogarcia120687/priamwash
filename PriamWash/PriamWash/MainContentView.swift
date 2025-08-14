//
//  MainContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct MainContentView: View {
    
    init() {
        
        if let brandBottomColor = UIColor(named: "BottomNavColor"){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = brandBottomColor
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            FindLaundryView()
                .tabItem {
                    Label("Find Laundry", systemImage: "location.fill")
                }
        }
        .accentColor(.white)
    }
}

#Preview {
    MainContentView()
}
