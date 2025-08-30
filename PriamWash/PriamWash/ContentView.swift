//
//  ContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

final class Router: ObservableObject {
    enum Route: Hashable {
        case account
    }
    @Published var rootPath = NavigationPath()
}

struct ContentView: View {
    
    @StateObject private var router = Router()
    @State private var showSplash = true
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        ZStack{
            NavigationStack(path: $router.rootPath){
                MainContentView()
                    .opacity(showSplash ? 0 : 1)
                    .environmentObject(router)
                    .navigationDestination(for: Router.Route.self){ route in
                        switch route {
                        case .account:
                            MyAccountView()
                        }
                    }
            }
            
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
