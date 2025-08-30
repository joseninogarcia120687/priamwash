//
//  PriamWashApp.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 13/8/25.
//

import SwiftUI

final class SessionStore: ObservableObject {
    
    @Published var isLoggedIn: Bool? = false { didSet { save() } }
    @Published var userId: String? = "" { didSet { save() } }
    
    init() { load() }
    
    private func save(){
        let d = UserDefaults.standard
        d.set(isLoggedIn, forKey: "IS_LOGGED_IN")
        d.set(userId, forKey: "USER_ID")
    }
    
    private func load(){
        let d = UserDefaults.standard
        isLoggedIn = d.bool(forKey: "IS_LOGGED_IN")
        userId = d.string(forKey: "USER_ID")
    }
    
    func signOut(){
        isLoggedIn = false;
        userId = "";
    }
}

@main
struct PriamWashApp: App {
    @StateObject private var session = SessionStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(session)
        }
    }
}
