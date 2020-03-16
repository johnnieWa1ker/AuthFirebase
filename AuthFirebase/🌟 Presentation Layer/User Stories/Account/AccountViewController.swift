//
//  AccountViewController.swift
//  AuthFirebase
//
//  Created by Johnnie Walker on 12.03.2020.
//  Copyright © 2020 Johnnie Walker. All rights reserved.
//

import GKViper

protocol AccountViewInput: ViperViewInput { }

protocol AccountViewOutput: ViperViewOutput {
    func logOutButtonPressed()
}

class AccountViewController: ViperViewController, AccountViewInput {

    // MARK: - Outlets
    @IBOutlet weak var logOutlButton: UIButton!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    
    // MARK: - Props
    fileprivate var output: AccountViewOutput? {
        guard let output = self._output as? AccountViewOutput else { return nil }
        return output
    }
    
    let user = User()
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = ""
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        if user.id != nil {
            self.userIdLabel.text = "User id: " + user.id!
        } else {
            self.userIdLabel.text = "User id: Unknown"
        }
        
        
        if user.email != nil {
            self.userEmailLabel.text = "Email: " + user.email!
        } else {
            self.userEmailLabel.text = "Email: Unknown"
        }
        
        self.logOutlButton.setTitle("Log Out", for: .normal)
    }
    
    func setupActions() {
        self.logOutlButton.addTarget(self, action: #selector(logOutButtonAction), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    // MARK: - AccountViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension AccountViewController {
    @objc
    func logOutButtonAction() {
        output?.logOutButtonPressed()
    }
}

// MARK: - Module functions
extension AccountViewController { }
