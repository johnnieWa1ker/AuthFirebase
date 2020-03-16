//
//  AccountRouter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol AccountRouterInput: ViperRouterInput {
    func presentHello()
}

class AccountRouter: ViperRouter, AccountRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: AccountViewController? {
        guard let mainController = self._mainController as? AccountViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - AccountRouterInput
    
    func presentHello() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createHello()
            controller.modalPresentationStyle = .fullScreen
            
            strongSelf.present(controller, animated: true)
        }
    }
    
    
    // MARK: - Module functions
    
    private func createHello() -> UIViewController {
        let helloVC = HelloAssembly.create()
        _ = HelloAssembly.configure(with: helloVC)
        return helloVC
    }
}
