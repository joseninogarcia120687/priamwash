//
//  LogoutView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import SwiftUI

struct LogoutView: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            Text("Are you sure you want \n to Log out?")
                .font(.system(size: 25))
                .multilineTextAlignment(.center)
            
            Button {
                session.signOut()
                dismiss()
            } label: {
                Text("Yes, Log me out")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .padding(EdgeInsets(top: 10, leading: 80, bottom: 0, trailing: 80))
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    LogoutView()
}
