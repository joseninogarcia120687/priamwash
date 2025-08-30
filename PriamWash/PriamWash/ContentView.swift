//
//  ContentView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

final class Router: ObservableObject {
    enum Route: Hashable {
        case login, logout
    }
    @Published var rootPath = NavigationPath()
}

extension SessionStore {
    static let preview: SessionStore = {
        let s = SessionStore()
        s.isLoggedIn = false
        s.userId = ""
        return s
    }()
}

extension Router {
    static let preview: Router = {
        let r = Router()
        r.rootPath.append(Router.Route.login)
        return r
    }()
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
                        case .login:
                            LogInView()
                        case .logout:
                            LogoutView()
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
        .environmentObject(SessionStore.preview)
}
