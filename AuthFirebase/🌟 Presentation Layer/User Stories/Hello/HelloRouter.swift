//
//  HelloRouter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol HelloRouterInput: ViperRouterInput {
    func presentSignUp()
    func presentSignIn()
}

class HelloRouter: ViperRouter, HelloRouterInput {
    
    // MARK: - Props
    
    fileprivate var mainController: HelloViewController? {
        guard let mainController = self._mainController as? HelloViewController else {
            return nil
        }
        return mainController
    }
    
    // MARK: - HelloRouterInput
    
    func presentSignUp() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createSignUp()
            controller.modalPresentationStyle = .fullScreen
            strongSelf.present(controller, animated: true)
        }
    }
    
    func presentSignIn() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            let controller = strongSelf.createSignIn()
            controller.modalPresentationStyle = .fullScreen
            strongSelf.present(controller, animated: true)
        }
    }
    
    // MARK: - Module functions
    
    private func createSignUp() -> UIViewController {
        let signUp = SignUpAssembly.create()
        _ = SignUpAssembly.configure(with: signUp)
        return signUp
    }
    
    private func createSignIn() -> UIViewController {
        let signIn = SignInAssembly.create()
        _ = SignInAssembly.configure(with: signIn)
        return signIn
    }
}
