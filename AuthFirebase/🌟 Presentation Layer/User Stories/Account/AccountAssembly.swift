//
//  AccountAssembly.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

enum AccountAssembly {
    
    // Create and return controller
    static func create() -> AccountViewController {
        return AccountViewController(nibName: AccountViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: AccountViewController) -> AccountPresenterInput {
        let presenter = AccountPresenter()
        
        let interactor = AccountInteractor()
        interactor._output = presenter
        
        let router = AccountRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
