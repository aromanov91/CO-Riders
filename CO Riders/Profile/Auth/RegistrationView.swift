//
//  RegistrationVIew.swift
//  CO Riders
//
//  Created by 18391981 on 14.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @State var helperStyle: M7TextFieldHelperStyle = .none
    
    
    @State var activateNavigation = false
    
    var body: some View {
        
        //NavigationLink(destination: StartingView(), isActive: $activateNavigation) {}
        
        ScrollView {
            
            M7TextField("E-mail", text: $email).padding(.horizontal)
            
            M7TextField("Пароль", text: $password, helperText: $error, helperStyle: $helperStyle).padding(.horizontal)
            
            M7Button(style: .primary, size: .l, round: .m, shadow: false, action: {
                
                registration()
                
            }) {
                Text("Регистрация")
            }.padding()
            
            
        }.navigationBarTitle("Зарегистрироваться").sheet(isPresented: $activateNavigation, content: {
            StartingView()
        })
    }
    
    
    func registration() {
        
        AuthService.shared.registr(email: self.email, password: self.password, confirmPassword: self.password) { (result) in
            
            switch result {
            
            case .success(let user):
                
                print("Registration Success \(String(describing: user.email))")
                
                FirestoreService.shared.createUser(id: user.uid, email: user.email ?? "", name: "", location: "", publish: "", status: "", company: "", badge: "", instagramLink: "")
                
                activateNavigation = true
                
                
            case .failure(let error):
                print("Registration Error")
                self.helperStyle = .errorText
                self.error = error.localizedDescription
            }
        }
    }
}

struct RegistrationVIew_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
