//
//  SignInPresenter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
import Firebase

protocol SignInPresenterInput: ViperPresenterInput { }

class SignInPresenter: ViperPresenter, SignInPresenterInput, SignInViewOutput, SignInInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: SignInViewInput? {
        guard let view = self._view as? SignInViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: SignInInteractorInput? {
        guard let interactor = self._interactor as? SignInInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: SignInRouterInput? {
        guard let router = self._router as? SignInRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: SignInViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = SignInViewModel()
    }
    
    // MARK: - SignInPresenterInput
    
    // MARK: - SignInViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func cancelButtonPressed() {
        self.router?.dismiss(animated: true)
    }
    
    func signInButtonPressed(email: String, password: String) {
        self.interactor?.sendAuthData(email: email, password: password)
    }
    // MARK: - SignInInteractorOutput
    func logInToTheApp() {
        self.router?.presentAccount()
    }
    
    // MARK: - Module functions
}
