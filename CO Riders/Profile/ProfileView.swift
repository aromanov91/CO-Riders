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

class SessionStore : ObservableObject {
    @Published var session: User?
    var isLoggedIn: Bool { session != nil}
    var handle: AuthStateDidChangeListenerHandle?
    
    init () {
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.session = user
            } else {
                self.session = nil
            }
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}

struct ProfileView: View {
    
    @ObservedObject var session = SessionStore()
    
    var body: some View {
        
        NavigationView {
            Group {
                if session.isLoggedIn {
                    
                    UserInformationView()
                    
                    
                } else {
                    LoginView()
                }
            }
        }
    }
}

struct UserAnnouncementListView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
