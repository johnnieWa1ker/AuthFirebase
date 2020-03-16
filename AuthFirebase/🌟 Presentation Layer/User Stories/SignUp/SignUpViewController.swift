//
//  SignUpViewController.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol SignUpViewInput: ViperViewInput { }

protocol SignUpViewOutput: ViperViewOutput {
    func signUpButtonPressed(name: String, email: String, password: String)
    func backToHello()
}

class SignUpViewController: ViperViewController, SignUpViewInput {
    
    // MARK: - Outlets
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Props
    fileprivate var output: SignUpViewOutput? {
        guard let output = self._output as? SignUpViewOutput else { return nil }
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
        self.userNameTextField.placeholder = "What's your name?"
        self.emailTextField.placeholder = "Enter you email"
        self.passwordTextField.placeholder = "Create password"
        self.signUpButton.setTitle("Sign Up", for: .normal)
    }
    
    func setupActions() {
        self.cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        
        self.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    // MARK: - SignUpViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
}

// MARK: - Actions
extension SignUpViewController {
    @objc
    func cancelButtonAction() {
        output?.backToHello()
    }
    
    @objc
    func signUpButtonAction() {
        
        // Код алерта дублируется в SignInController, хотелось бы его как то убрать
        let alert = UIAlertController(title: "Ups 😥", message: "It looks like you did not fill out all the fields", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(alertAction)
        
        guard let name = self.userNameTextField.text else { return }
        guard let email = self.emailTextField.text else { return }
        guard let password = self.passwordTextField.text else { return }
        
        if (name.isEmpty || email.isEmpty || password.isEmpty) {
            self.present(alert, animated: true, completion: nil)
        } else {
            self.output?.signUpButtonPressed(name: name, email: email, password: password)
        }
    }
}

// MARK: - Module functions
extension SignUpViewController { }
