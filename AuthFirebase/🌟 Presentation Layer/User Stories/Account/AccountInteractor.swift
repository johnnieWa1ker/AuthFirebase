//
//  AccountInteractor.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
import Firebase

protocol AccountInteractorInput: ViperInteractorInput { }

protocol AccountInteractorOutput: ViperInteractorOutput { }

open class AccountInteractor: ViperInteractor, AccountInteractorInput {
    
    
    // MARK: - Props
    private var output: AccountInteractorOutput? {
        guard let output = self._output as? AccountInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {
        super.init()
    }
    
    // MARK: - AccountInteractorInput
    
    // MARK: - Module functions
}
