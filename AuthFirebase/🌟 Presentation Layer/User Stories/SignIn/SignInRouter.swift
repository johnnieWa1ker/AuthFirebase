//
//  SignInRouter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol SignInRouterInput: ViperRouterInput {
    func presentAccount()
}

class SignInRouter: ViperRouter, SignInRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: SignInViewController? {
        guard let mainController = self._mainController as? SignInViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - SignInRouterInput
    func presentAccount() {
        DispatchQueue.main.async { [weak self] in
                guard let strongSelf = self else { return }
        
                let controller = strongSelf.createAccount()
            controller.modalPresentationStyle = .overFullScreen
                
                strongSelf.present(controller, animated: true)
            }
    }
    
    // MARK: - Module functions
    private func createAccount() -> UIViewController {
        let accountVC = AccountAssembly.create()
        _ = AccountAssembly.configure(with: accountVC)
        return accountVC
    }
}
