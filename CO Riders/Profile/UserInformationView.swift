//
//  UserInformationView.swift
//  CO Riders
//
//  Created by 18391981 on 23.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct UserInformationView: View {
    
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        Form {
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(Color.gray)
                Text(self.session.session?.uid ?? "")
            }
            HStack {
                Text("E-mail")
                Spacer()
                Text(self.session.session?.email ?? "")
            }
            HStack {
                Text("Телефон")
            }
            
            Button(action: {
                
                AuthService.shared.signOut()
                
            }) {
                Text("Выйти")
            }
            
        }.navigationBarTitle("Аккаунт")
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
    }
}
