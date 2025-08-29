//
//  AccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 16/8/25.
//

import SwiftUI

struct AccountView: View {
    
    @State private var items = ["My Account"]
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                
            }
            .padding(EdgeInsets(top: 50, leading: 0, bottom: 50, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("BottomNavColor"))
            
            List(items, id: \.self){name in
                HStack {
                    Image(systemName: "circle.fill")
                    Text(name)
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    AccountView()
}
