//
//  AuthService.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 13.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
import FirebaseAuth

class AuthService {
    
    func createUser(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password, completion: nil)
    }
}
