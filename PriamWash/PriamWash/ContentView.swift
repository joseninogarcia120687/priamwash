//
//  ContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showSplash = true
    
    var body: some View {
        ZStack{
            MainContentView()
                .opacity(showSplash ? 0 : 1)
            
            if showSplash {
                SplashView()
                    .transition(.opacity.combined(with: .scale))
            }
        }
        .task {
            try? await Task.sleep(nanoseconds: 1_200_000_000)
            withAnimation(.easeOut(duration: 0.4)){
                showSplash = false
            }
        }
    }
}

#Preview {
    ContentView()
}
