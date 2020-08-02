//
//  S.swift
//  CO Riders
//
//  Created by 18391981 on 02.08.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import Firebase
import FirebaseAuth

class SessionService : ObservableObject {
    
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
