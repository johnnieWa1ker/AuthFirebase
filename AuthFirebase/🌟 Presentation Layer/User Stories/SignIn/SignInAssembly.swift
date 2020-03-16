//
//  SignInAssembly.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

enum SignInAssembly {
    
    // Create and return controller
    static func create() -> SignInViewController {
        return SignInViewController(nibName: SignInViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: SignInViewController) -> SignInPresenterInput {
        let presenter = SignInPresenter()
        
        let interactor = SignInInteractor()
        interactor._output = presenter
        
        let router = SignInRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
