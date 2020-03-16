//
//  SignUpPresenter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol SignUpPresenterInput: ViperPresenterInput { }

class SignUpPresenter: ViperPresenter, SignUpPresenterInput, SignUpViewOutput, SignUpInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: SignUpViewInput? {
        guard let view = self._view as? SignUpViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: SignUpInteractorInput? {
        guard let interactor = self._interactor as? SignUpInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: SignUpRouterInput? {
        guard let router = self._router as? SignUpRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: SignUpViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = SignUpViewModel()
    }
    
    // MARK: - SignUpPresenterInput
    
    // MARK: - SignUpViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func backToHello() {
        self.router?.dismiss(animated: true)
    }
    
    func signUpButtonPressed(name: String, email: String, password: String) {
        self.interactor?.createUser(name: name, email: email, password: password)
    }
    
    
    // MARK: - SignUpInteractorOutput
    func logInToTheApp() {
        self.router?.presentAccount()
    }
    
    // MARK: - Module functions
}
