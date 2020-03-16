//
//  HelloPresenter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol HelloPresenterInput: ViperPresenterInput { }

class HelloPresenter: ViperPresenter, HelloPresenterInput, HelloViewOutput, HelloInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: HelloViewInput? {
        guard let view = self._view as? HelloViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: HelloInteractorInput? {
        guard let interactor = self._interactor as? HelloInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: HelloRouterInput? {
        guard let router = self._router as? HelloRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: HelloViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = HelloViewModel()
    }
    
    // MARK: - HelloPresenterInput
    
    // MARK: - HelloViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func presentSignUp() {
        self.router?.presentSignUp()
    }
    
    func presentSignIn() {
        self.router?.presentSignIn()
    }
    
    // MARK: - HelloInteractorOutput
    
    // MARK: - Module functions
}
