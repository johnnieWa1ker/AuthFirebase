//
//  HelloAssembly.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

enum HelloAssembly {
    
    // Create and return controller
    static func create() -> HelloViewController {
        return HelloViewController(nibName: HelloViewController.identifier, bundle: nil)
    }
    
    // Create and link modules with controller, return presenter input
    static func configure(with reference: HelloViewController) -> HelloPresenterInput {
        let presenter = HelloPresenter()
        
        let interactor = HelloInteractor()
        interactor._output = presenter
        
        let router = HelloRouter()
        router._mainController = reference
        
        presenter._view = reference
        presenter._interactor = interactor
        presenter._router = router
        
        reference._output = presenter
        
        return presenter
    }
    
}
