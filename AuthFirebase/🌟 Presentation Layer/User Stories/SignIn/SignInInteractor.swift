//
//  SignInInteractor.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
//import Firebase

protocol SignInInteractorInput: ViperInteractorInput {
    func sendAuthData(email: String, password: String)
}

protocol SignInInteractorOutput: ViperInteractorOutput {
    func logInToTheApp()
}

open class SignInInteractor: ViperInteractor, SignInInteractorInput {

    // MARK: - Props
    private var output: SignInInteractorOutput? {
        guard let output = self._output as? SignInInteractorOutput else {
            return nil
        }
        return output
    }
    
    let authService = AuthService()
    
    // MARK: - Initialization
    override init() {
        super.init()
    }
    
    // MARK: - SignInInteractorInput
    func sendAuthData(email: String, password: String) {
        self.authService.logIn(email: email, password: password)
        self.output?.logInToTheApp()
    }
    
    // MARK: - Module functions
}
