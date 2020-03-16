//
//  InitialRouter.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialRouterInput: ViperRouterInput {
    func presentAccount()
    func presentHello()
}

class InitialRouter: ViperRouter, InitialRouterInput {
    
    
    // MARK: - Props
    fileprivate var mainController: InitialViewController? {
        guard let mainController = self._mainController as? InitialViewController else {
            return nil
        }
        return mainController
    }
    
    
    // MARK: - InitialRouterInput
    func presentAccount() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createAccount()
            
            controller.modalTransitionStyle = .coverVertical
            controller.modalPresentationStyle = .fullScreen
            strongSelf.present(controller, animated: true)

        }
    }
    
    func presentHello() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createHello()
            
            
            controller.modalPresentationStyle = .fullScreen
            strongSelf.present(controller, animated: false)
        }
    }
    
    // MARK: - Module functions
    private func createAccount() -> UIViewController {
        let controller = AccountAssembly.create()
        _ = AccountAssembly.configure(with: controller)
        return controller
    }
    
    private func createHello() -> UIViewController {
        let controller = HelloAssembly.create()
        _ = HelloAssembly.configure(with: controller)
        return controller
    }
}
