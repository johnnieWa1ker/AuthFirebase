//
//  SignUpInteractor.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
//import FirebaseAuth

protocol SignUpInteractorInput: ViperInteractorInput {
    func createUser(name: String, email: String, password: String)
}

protocol SignUpInteractorOutput: ViperInteractorOutput {
    func logInToTheApp()
}

open class SignUpInteractor: ViperInteractor, SignUpInteractorInput {
    
    // MARK: - Props
    private var output: SignUpInteractorOutput? {
        guard let output = self._output as? SignUpInteractorOutput else {
            return nil
        }
        return output
    }
    
    let authService = AuthService()
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - SignUpInteractorInput
    func createUser(name: String, email: String, password: String) {
        
        self.authService.createUser(name: name, email: email, password: password)
        
        self.output?.logInToTheApp()
    }
    
    // MARK: - Module functions
}
