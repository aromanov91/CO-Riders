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
    
    var body: some View {
        
        ScrollView {
        
            TextField("Login", text: $email)
            
            TextField("Password", text: $password)
            
            Button(action: {
                
                AuthService.shared.registr(email: self.email, password: self.password, confirmPassword: self.password) { (result) in
                    
                    switch result {
                        
                    case .success(let user):
                        
                        print("Registration Success \(String(describing: user.email))")
                        
                    case .failure(_):
                        print("Registration Error")
                    }
                    
                }
                
                
                
            }) {
                Text("Registration")
            }
        }
    }
    
}

struct RegistrationVIew_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
