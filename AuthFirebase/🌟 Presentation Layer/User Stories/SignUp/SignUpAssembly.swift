//
//  SignUpAssembly.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

enum SignUpAssembly {
    
    // Create and return controller
    static func create() -> SignUpViewController {
        return SignUpViewController(nibName: SignUpViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SignUpViewController) -> SignUpPresenterInput {
        let presenter = SignUpPresenter()
        
        let interactor = SignUpInteractor()
        interactor._output = presenter
        
        let router = SignUpRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
