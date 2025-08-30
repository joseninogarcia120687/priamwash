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
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                
                Button {
                    
                } label: {
                    Label("Login/Sign Up", systemImage: "arrow.right.square.fill")
                        .padding(.vertical, 15).padding(.horizontal, 16)
                        .frame(maxWidth: 200)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
            }
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 30, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("BottomNavColor"))
            
            List(items, id: \.0){ name, img in
                HStack {
                    Image(systemName: img)
                        .resizable()
                        .foregroundColor(Color("BottomNavColor"))
                        .frame(width: 30, height: 30)
                    Text(name)
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            
            Spacer()
        }
    }
}

#Preview {
    AccountView()
}
