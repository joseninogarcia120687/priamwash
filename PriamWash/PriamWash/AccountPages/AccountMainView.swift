//
//  AccountMainView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import SwiftUI

struct AccountMainView: View {
    
    @State private var pageToShow = "LOGIN"
    
    var body: some View {
        VStack {
            if pageToShow == "LOGIN" {
                LogInView(pageToShow: $pageToShow)
            }else{
                CreateAccountView(pageToShow: $pageToShow)
            }
        }
        .animation(.easeIn, value: true)
    }
}

#Preview {
    AccountMainView()
}
