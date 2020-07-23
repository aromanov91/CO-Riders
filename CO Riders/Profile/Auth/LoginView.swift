//
//  LoginView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var error = ""
    @State var helperStyle: M7TextFieldHelperStyle = .none
    
    var body: some View {
        
        ScrollView() {
            
            HStack {
            
            M7Text("Бронируйте услуги, задавайте вопросы и сохраняйте объявления в избранное", style: .paragraph1)
                
                Spacer()
            
            }.padding(.top, 8)
            .padding(.bottom, 24)
            
            
            
            M7TextField("E-mail", text: $email)
                .padding(.bottom)
            
            M7TextField("Пароль", text: $password, helperText: $error, helperStyle: $helperStyle)
                .padding(.bottom)
            
            M7Button(style: .primary, size: .l, round: .m, shadow: false, action: {
                AuthService.shared.login(email: self.email, password: self.password) { (result) in
                    
                    switch result {
                        
                    case .success(let user):
                        
                        print("Login Success \(String(describing: user.email))")
                        
                    case .failure(let error):
                        print("Login Error")
                        self.helperStyle = .errorText
                        self.error = error.localizedDescription
                    }
                    
                }
            }) {
                Text("Вход")
            }
            .padding(.bottom)

                NavigationLink(destination: RegistrationView()) {
                    Text("Зарегистрироваться")
                }
            
        }.padding([.leading, .bottom, .trailing])
            .navigationBarTitle("Вход")
        

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
