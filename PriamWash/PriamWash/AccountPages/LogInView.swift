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
    
    @Binding var pageToShow: String
    
    @EnvironmentObject var session: SessionStore
    @Environment(\.dismiss) private var dismiss
    
    @State private var emailaddress = ""
    @State private var password = ""
    @State private var showError = false
    @State private var errorMessage = ""
        
    var body: some View {
        VStack(spacing: 10) {
            Image("Logo")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Log In Account")
                .padding(EdgeInsets(top: -30, leading: 0, bottom: 30, trailing: 0))
                .foregroundColor(Color("BottomNavColor"))
                .font(.system(size: 25))
                .fontWeight(.bold)
            Text("E-mail Address")
                .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("BottomNavColor"))
            TextField("", text: $emailaddress)
                .font(.system(size: 13))
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                .foregroundColor(Color.gray)
                .onChange(of: emailaddress) { emailaddress = String($0.prefix(35)) }
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                .font(.system(size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("BottomNavColor"))
            SecureField("", text: $password)
                .font(.system(size: 13))
                .textContentType(.password)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                .foregroundColor(Color.gray)
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
                        
                        print(authUser)
                        
                        if authUser.sucess == true {
                            if authUser.payload?.isAuthenticated == true {
                                session.userId = authUser.payload?.userID
                                session.isLoggedIn = true
                                dismiss()
                            }
                            else{
                                showError = true
                                errorMessage = "E-mail Address or Password is incorrect."
                                return
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
            
            Button {
                pageToShow = "CREATE_ACCOUNT"
            } label: {
                Text("No account? Create one.")
                    .font(.system(size: 18))
                    .underline()
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
            }
            .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0))
            
            Spacer()
       }
    }
}

#Preview {
    LogInView(pageToShow: .constant("LOGIN"))
        .environmentObject(SessionStore.preview)
        .environmentObject(Router.preview)
}
