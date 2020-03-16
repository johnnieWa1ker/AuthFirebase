//
//  SignInViewController.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol SignInViewInput: ViperViewInput { }

protocol SignInViewOutput: ViperViewOutput {
    func cancelButtonPressed()
    func signInButtonPressed(email: String, password: String)
}

class SignInViewController: ViperViewController, SignInViewInput {
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: SignInViewOutput? {
        guard let output = self._output as? SignInViewOutput else { return nil }
        return output
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.cancelButton.setTitle("Cancel", for: .normal)
        self.emailTextField.placeholder = "Email"
        self.passwordTextField.placeholder = "Password"
        self.signInButton.setTitle("Sign In", for: .normal)
    }
    
    func setupActions() {
        self.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        self.signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    // MARK: - SignInViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension SignInViewController {
    @objc
    func cancelButtonAction() {
        output?.cancelButtonPressed()
    }
    
    @objc
    func signInButtonAction() {
        
        // Код алерта дублируется в SignUpController, хотелось бы его как то убрать
        let alert = UIAlertController(title: "Ups 😥", message: "It looks like you did not fill out all the fields", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(alertAction)
    
        guard let email = self.emailTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        if (email.isEmpty || password.isEmpty) {
            self.present(alert, animated: true, completion: nil)
        } else {
            self.output?.signInButtonPressed(email: email, password: password)
        }
    }
}

// MARK: - Module functions
extension SignInViewController { }
