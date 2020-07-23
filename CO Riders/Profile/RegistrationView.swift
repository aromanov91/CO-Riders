//
//  RegistrationVIew.swift
//  CO Riders
//
//  Created by 18391981 on 14.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import Firebase
import FirebaseAuth

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @State var helperStyle: M7TextFieldHelperStyle = .none
    
    var body: some View {
        
        ScrollView {

            M7TextField("E-mail", text: $email).padding(.horizontal)
            
            M7TextField("Пароль", text: $password, helperText: $error, helperStyle: $helperStyle).padding(.horizontal)
            
            M7Button(style: .primary, size: .l, round: .m, shadow: false, action: {
                AuthService.shared.registr(email: self.email, password: self.password, confirmPassword: self.password) { (result) in
                    
                    switch result {
                        
                    case .success(let user):
                        
                        print("Registration Success \(String(describing: user.email))")
                        
                    case .failure(let error):
                    print("Registration Error")
                    self.helperStyle = .errorText
                    self.error = error.localizedDescription
                    }
                    
                }
            }) {
                Text("Регистрация")
                }.padding()


        }.navigationBarTitle("Зарегистрироваться")
    }
    
}

struct RegistrationVIew_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
