//
//  AccountPresenter.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper
import FirebaseAuth

protocol AccountPresenterInput: ViperPresenterInput { }

class AccountPresenter: ViperPresenter, AccountPresenterInput, AccountViewOutput, AccountInteractorOutput {
    
    // MARK: - Props
    fileprivate var view: AccountViewInput? {
        guard let view = self._view as? AccountViewInput else {
            return nil
        }
        return view
    }
    
    fileprivate var interactor: AccountInteractorInput? {
        guard let interactor = self._interactor as? AccountInteractorInput else {
            return nil
        }
        return interactor
    }
    
    fileprivate var router: AccountRouterInput? {
        guard let router = self._router as? AccountRouterInput else {
            return nil
        }
        return router
    }
    
    var viewModel: AccountViewModel
    
    // MARK: - Initialization
    override init() {
        self.viewModel = AccountViewModel()
    }
    
    // MARK: - AccountPresenterInput
    
    // MARK: - AccountViewOutput
    override func viewIsReady(_ controller: UIViewController) {
        self.view?.setupInitialState(with: self.viewModel)
    }
    
    func logOutButtonPressed() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
        self.router?.presentHello()
    }
    
    // MARK: - AccountInteractorOutput
    
    // MARK: - Module functions
}
