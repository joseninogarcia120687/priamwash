//
//  MyAccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import SwiftUI

struct MyAccountView: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var emailaddress = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 10){
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
            Text("E-mail Address")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.system(size: 20))
                .fontWeight(.bold)
            TextField("", text: $emailaddress)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                .font(.system(size: 20))
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.system(size: 20))
                .fontWeight(.bold)
            SecureField("", text: $password)
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                .font(.system(size: 20))
            Button {
                Task {
                    do {
                        var ms = AuthMemberMS()
                        let authUser = try await ms.createPOST(.init(emailAddress: emailaddress, password: password))
                        session.userId = authUser.payload.userID
                    }catch{
                        print("POST failed", error)
                    }
                }
                session.isLoggedIn = true
                dismiss()
            } label: {
                Label("Log In", systemImage: "arrow.right.square.fill")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                    .font(.system(size: 20))
            }
           Spacer()
       }
    }
}

#Preview {
    MyAccountView()
}
