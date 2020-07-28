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
import FirebaseFirestore
import FirebaseFirestoreSwift

struct RegistrationView: View {
    
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @State var helperStyle: M7TextFieldHelperStyle = .none
    
    var db: Firestore!

    init() {

        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
    }
    
    var body: some View {
        
        ScrollView {
            
            M7TextField("E-mail", text: $email).padding(.horizontal)
            
            M7TextField("Пароль", text: $password, helperText: $error, helperStyle: $helperStyle).padding(.horizontal)
            
            M7Button(style: .primary, size: .l, round: .m, shadow: false, action: {
                
                registration()
                
            }) {
                Text("Регистрация")
            }.padding()
            
            
        }.navigationBarTitle("Зарегистрироваться")
    }
    
    
    func registration() {
        
        AuthService.shared.registr(email: self.email, password: self.password, confirmPassword: self.password) { (result) in
            
            switch result {
            
            case .success(let user):
                
                print("Registration Success \(String(describing: user.email))")
                
                createUserData()
                
            case .failure(let error):
                print("Registration Error")
                self.helperStyle = .errorText
                self.error = error.localizedDescription
            }
        }
    }
    
    func createUserData() {
        
        var ref: DocumentReference? = nil
            ref = self.db.collection("users").addDocument(data: [
                "email": self.email,
                "id": ref?.documentID ?? ""

        ]) { error in
            if let error = error {
                print("Error adding document: \(error)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}

struct RegistrationVIew_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
