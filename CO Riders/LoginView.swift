//
//  LoginView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    var email = ""
    
    init() {
       
         let user = Auth.auth().currentUser
        
        if let user = user {
          // The user's ID, unique to the Firebase project.
          // Do NOT use this value to authenticate with your backend server,
          // if you have one. Use getTokenWithCompletion:completion: instead.
          
            self.email = user.email ?? ""
          // ...
        }
        
        
        
    }
    
    
    
    var body: some View {
        Text(email)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
