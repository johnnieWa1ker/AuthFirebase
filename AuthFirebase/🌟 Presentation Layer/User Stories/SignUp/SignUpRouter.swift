//
//  SignUpRouter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol SignUpRouterInput: ViperRouterInput {
    func presentAccount()
}

class SignUpRouter: ViperRouter, SignUpRouterInput {
    
    // MARK: - Props
    fileprivate var mainController: SignUpViewController? {
        guard let mainController = self._mainController as? SignUpViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - SignUpRouterInput
    func presentAccount() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createAccount()
            controller.modalPresentationStyle = .fullScreen
            
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
