//
//  AccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 16/8/25.
//

import SwiftUI

struct AccountView: View {
    
    @State private var items = [
        ("My Account", "person.circle.fill"),
        ("Settings", "gear.circle.fill"),
        ("Help", "questionmark.circle.fill"),
        ("Contact Us", "phone.fill"),
        ("Logout", "rectangle.portrait.and.arrow.forward")
    ]
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(Color("BottomNavColor"))
                
                if session.isLoggedIn == false {
                    Button {
                        router.rootPath.append(Router.Route.accountmainview)
                    } label: {
                        Text("Login / Sign Up")
                            .padding(.vertical, 15).padding(.horizontal, 16)
                            .frame(maxWidth: 200)
                            .foregroundStyle(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                            .underline()
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 20, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(.white)
            
            List(items, id: \.0){ name, img in
                
                if name == "Logout" {
                    if session.isLoggedIn == true {
                        HStack {
                            Image(systemName: img)
                                .resizable()
                                .foregroundColor(Color("BottomNavColor"))
                                .frame(width: 30, height: 30)
                            Button {
                                if name == "Logout" {
                                    router.rootPath.append(Router.Route.logout)
                                }
                            } label: {
                                Text(name)
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                    }
                } else {
                    HStack {
                        Image(systemName: img)
                            .resizable()
                            .foregroundColor(Color("BottomNavColor"))
                            .frame(width: 30, height: 30)
                        Button { } label: {
                            Text(name)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
                }
            }
            
            Spacer()
        }
        .task {
            
        }
    }
}

#Preview {
    AccountView()
        .environmentObject(Router.preview)
        .environmentObject(SessionStore.preview)
}
