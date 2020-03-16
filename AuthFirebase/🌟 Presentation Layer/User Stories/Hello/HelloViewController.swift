//
//  HelloViewController.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol HelloViewInput: ViperViewInput { }

protocol HelloViewOutput: ViperViewOutput {
    func presentSignUp()
    func presentSignIn()
}

class HelloViewController: ViperViewController, HelloViewInput {

    // MARK: - Outlets
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    // MARK: - Props
    fileprivate var output: HelloViewOutput? {
        guard let output = self._output as? HelloViewOutput else { return nil }
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
        self.backgroundImageView.image = AppAssets.appBackground
        
        //signUpButton setup
        self.signUpButton.backgroundColor = UIColor.systemBlue
        self.signUpButton.setTitleColor(UIColor.white, for: .normal)
        self.signUpButton.setTitle("SignUp", for: .normal)
        
        //signIpButton  setup
        self.signInButton.backgroundColor = UIColor.systemBlue
        self.signInButton.setTitleColor(UIColor.white, for: .normal)
        self.signInButton.setTitle("Sign In", for: .normal)
    }
    
    func setupActions() {
        self.signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        self.signInButton.addTarget(self, action: #selector(signInButtonAction), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    // MARK: - HelloViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension HelloViewController {
    @objc
    func signUpButtonAction() {
        self.output?.presentSignUp()
    }
    
    @objc
    func signInButtonAction() {
        self.output?.presentSignIn()
    }
}

// MARK: - Module functions
extension HelloViewController { }
