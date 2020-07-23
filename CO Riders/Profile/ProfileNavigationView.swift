//
//  UserAnnouncementListView.swift
//  CO Riders
//
//  Created by 18391981 on 15.07.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import SwiftUI
import M7SwiftUI
import Firebase
import FirebaseAuth

struct ProfileNavigationView: View {
    
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        
        NavigationView {
            
            Group {
                
                if session.isLoggedIn {
                    
                    //UserInformationView()
                    ProfileEmptyView()
                    
                } else {
                    LoginView()
                }
            }
        }
    }
}

struct UserAnnouncementListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavigationView()
    }
}
