//
//  CreateAccountView.swift
//  PriamWash
//
//  Created by Jose Nino Garcia on 31/8/25.
//

import SwiftUI

enum Gender: String, CaseIterable, Identifiable {
    case Male, Female
    var id: String { rawValue }
    var title: String { rawValue }
}

extension String {
    var digitsOnly: String { filter { $0.isNumber } }
}

struct CreateAccountView: View {
    
    @Binding var pageToShow: String
    
    @EnvironmentObject var router: Router
    @Environment(\.dismiss) private var dismiss
    
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var genderChoice: Gender = .Male
    @State private var mobileNumber: String = ""
    @State private var emailaddress: String = ""
    @State private var password: String = ""
    @State private var reTypedPassword: String = ""
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Create Account")
                    .padding(EdgeInsets(top: -40, leading: 0, bottom: 0, trailing: 0))
                    .foregroundColor(Color("BottomNavColor"))
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Text("Firstname")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
                TextField("", text: $firstname)
                    .font(.system(size: 13))
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                    .foregroundColor(Color.gray)
                    .onChange(of: firstname) { firstname = String($0.prefix(35)) }
                Text("Lastname")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
                TextField("", text: $lastname)
                    .font(.system(size: 13))
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                    .foregroundColor(Color.gray)
                    .onChange(of: lastname) { lastname = String($0.prefix(35)) }
                Text("Gender")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
                Picker("", selection: $genderChoice){
                    ForEach(Gender.allCases){ a in
                        Text(a.title).tag(a)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                .pickerStyle(.segmented)
                
                Text("Mobile Number (Optional)")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
                TextField("", text: $mobileNumber)
                    .font(.system(size: 13))
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.telephoneNumber)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                    .foregroundColor(Color.gray)
                    .onChange(of: mobileNumber) { 
                        mobileNumber = String($0.prefix(15));
                        mobileNumber = $0.digitsOnly
                    }
                
                Text("E-mail Address")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
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
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
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
                    .foregroundColor(.gray)
                    .onChange(of: password) { password = String($0.prefix(12)) }
                
                Text("Re-type Password")
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .foregroundColor(Color("BottomNavColor"))
            
                SecureField("", text: $reTypedPassword)
                    .font(.system(size: 13))
                    .textContentType(.password)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .padding(EdgeInsets(top: 0, leading: 18, bottom: 0, trailing: 18))
                    .foregroundColor(.gray)
                    .onChange(of: reTypedPassword) { reTypedPassword = String($0.prefix(12)) }
                
                Button {
                    Task {
                        let helper = CreateAccountHelper()
                        let validate = helper.validateInput(firstname: firstname, lastname: lastname, gender: genderChoice.rawValue, mobilenumber: mobileNumber, emailAddress: emailaddress, password: password, reTypedPassword: reTypedPassword)
                        
                        print("Is Validation Successful?:", validate.0)
                        print("Error Message:", validate.1)
                        
                        if validate.0 == false {
                            showError = true
                            errorMessage = validate.1
                            return
                        }
                        
                        do {
                            let ms = CreateMemberMS()
                            let response = try await ms.createPOST(.init(firstname: firstname, lastname: lastname, password: password, gender: genderChoice.rawValue, mobileNumber: mobileNumber, emailAddress: emailaddress))
                            
                            if response.sucess {
                                if response.returnCode == "00" {
                                    if response.payload?.isCreated == true {
                                        showError = true
                                        errorMessage = "You have successfully created an account. You may proceed to Log In using your E-mail Address and Password."
                                        
                                        firstname = ""
                                        lastname = ""
                                        mobileNumber = ""
                                        emailaddress = ""
                                        password = ""
                                        reTypedPassword = ""
                                        return
                                    }
                                }
                                else if response.returnCode == "03" {
                                    if response.errors!.count > 0 {
                                        let error = response.errors?.first
                                        if error?.messageCode == "A03" {
                                            showError = true
                                            errorMessage = "The account has already exist. Please try again."
                                            return
                                        }
                                    }
                                }
                            }
                        }catch {
                            print("Error!", error)
                        }
                    }
                } label: {
                    Text("Submit")
                        .padding(.vertical, 15)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(.white)
                        .background(Color("BottomNavColor"))
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 0, trailing: 15))
                        .font(.system(size: 18))
                }
                .alert(errorMessage, isPresented: $showError){
                    Button("OK", role: .cancel) { }
                }
                
                Button {
                    pageToShow = "LOGIN"
                } label: {
                    Text("Have account? Log me in.")
                        .font(.system(size: 18))
                        .underline()
                        .fontWeight(.bold)
                        .foregroundColor(Color("BottomNavColor"))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    CreateAccountView(pageToShow: .constant("CREATE_ACCOUNT"))
        .environmentObject(Router.preview)
}

class CreateAccountHelper {
    func validateInput(firstname: String, lastname: String, gender: String, mobilenumber: String, emailAddress: String, password: String, reTypedPassword: String) -> (Bool, String) {
        
        let trimmedFirstname = firstname.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedLastname = lastname.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedGender = gender.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedMobilenumber = mobilenumber.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedEmailAddress = emailAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedRetypedPassword = reTypedPassword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedFirstname.isEmpty else {
            return (false, "Please enter your Firstname.")
        }
        
        guard !trimmedLastname.isEmpty else {
            return (false, "Please enter your Lastname.")
        }
        
        guard !trimmedGender.isEmpty else {
            return (false, "Please choose the Gender.")
        }
        
        guard !trimmedEmailAddress.isEmpty else {
            return (false, "Please enter your E-mail Address.")
        }
        
        guard !trimmedPassword.isEmpty else {
            return (false, "Please enter your Password.")
        }
        
        guard !trimmedRetypedPassword.isEmpty else {
            return (false, "Please enter your password again.")
        }
        
        if trimmedPassword != trimmedRetypedPassword {
            return (false, "Re-typed password does not matched.")
        }
        
        return (true, "")
    }
}


