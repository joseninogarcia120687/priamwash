//
//  MyAccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 30/8/25.
//

import SwiftUI

extension Binding where Value == String {
    func maxLength(_ max: Int) -> Binding<String> {
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = String($0.prefix(max)) }
        )
    }
}

struct LogInView: View {
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var emailaddress = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
        
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
                .onChange(of: emailaddress) { emailaddress = String($0.prefix(35)) }
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
                .onChange(of: password){ password = String($0.prefix(12)) }
            Button {
                Task {
                    let trimmedEmail = emailaddress.trimmingCharacters(in: .whitespacesAndNewlines)
                    guard !trimmedEmail.isEmpty else {
                        errorMessage = "Please enter your e-mail address."
                        showError = true
                        return
                    }
                    
                    if trimmedEmail.count > 35  {
                        errorMessage = "E-mail address should not exceed to 35 characters."
                        showError = true
                        return
                    }
                    
                    if !Helper.isValidEmail(trimmedEmail) {
                        errorMessage = "Please enter a valid e-mail address."
                        showError = true
                        return
                    }
                    
                    guard !password.isEmpty else {
                        errorMessage = "Please enter your password."
                        showError = true
                        return
                    }
                    
                    if password.count > 12 {
                        errorMessage = "Password should not exceed to 12 characters."
                        showError = true
                        return
                    }
                    
                    do {
                        var ms = AuthMemberMS()
                        let authUser = try await ms.createPOST(.init(emailAddress: emailaddress, password: password))
                        
                        if authUser.sucess == true {
                            if authUser.payload.isAuthenticated == true {
                                session.userId = authUser.payload.userID
                                session.isLoggedIn = true
                                dismiss()
                            }
                        }else{
                            showError = true
                            errorMessage = "Unable to Log In. Please try again later."
                            return
                        }
                    } catch {
                        print("POST failed", error)
                    }
                }
            } label: {
                Label("Log In", systemImage: "arrow.right.square.fill")
                    .padding(.vertical, 15)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(Color("BottomNavColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                    .font(.system(size: 20))
            }
            .alert(errorMessage, isPresented: $showError){
                Button("OK", role: .cancel) { }
            }
            Spacer()
       }
    }
}

#Preview {
    LogInView()
        .environmentObject(SessionStore.preview)
        .environmentObject(Router.preview)
}
