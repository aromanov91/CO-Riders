//
//  UserInformationLinkView.swift
//  CO Riders
//
//  Created by 18391981 on 24.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI

struct UserInformationLinkView: View {
    
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        
        M7Surface(background: .secondary, padding: .s) {
            
            NavigationLink(destination: UserInformationView()) {
                HStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.gray)
                    M7Text(session.session?.email ?? "User")
                    
                    Image(systemName: "chevron.right")
                    Spacer()
                }
            }
        }
          
    }
}

struct UserInformationLinkView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationLinkView()
    }
}
