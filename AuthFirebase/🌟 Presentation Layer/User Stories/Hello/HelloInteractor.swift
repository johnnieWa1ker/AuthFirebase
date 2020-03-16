//
//  HelloInteractor.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol HelloInteractorInput: ViperInteractorInput { }

protocol HelloInteractorOutput: ViperInteractorOutput { }

open class HelloInteractor: ViperInteractor, HelloInteractorInput {

    // MARK: - Props
    private var output: HelloInteractorOutput? {
        guard let output = self._output as? HelloInteractorOutput else {
            return nil
        }
        return output
    }
    
    // MARK: - Initialization
    override init() {        
        super.init()
    }
    
    // MARK: - HelloInteractorInput
    
    // MARK: - Module functions
}
