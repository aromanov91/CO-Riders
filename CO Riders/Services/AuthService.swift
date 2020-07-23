//
//  AuthService.swift
//  Groove
//
//  Created by 18391981 on 20.04.2020.
//  Copyright © 2020 romanov. All rights reserved.
//

import Firebase
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private let auth = Auth.auth()
    
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        auth.signIn(withEmail: email!, password: password!) { (result, error) in
            
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
            
        }
        
    }
    
    func registr(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        auth.createUser(withEmail: email!, password: password!, completion: { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
            
        })
    }
    
    
    func signOut() {
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

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
