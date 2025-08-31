//
//  CreateAccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import SwiftUI

struct CreateAccountView: View {
    
    @Binding var pageToShow: String
    
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        Button {
            pageToShow = "LOGIN"
        } label: {
            Text("Have account? Log me in.")
        }
    }
}

#Preview {
    CreateAccountView(pageToShow: .constant("CREATE_ACCOUNT"))
        .environmentObject(Router.preview)
}
