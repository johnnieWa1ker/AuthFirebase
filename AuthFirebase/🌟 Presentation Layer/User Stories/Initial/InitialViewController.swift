//
//  InitialViewController.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKViper

protocol InitialViewInput: ViperViewInput { }

protocol InitialViewOutput: ViperViewOutput {
    func prepareApp()
}

class InitialViewController: ViperViewController, InitialViewInput {

    // MARK: - Outlets
    @IBOutlet private weak var backgroundImageView: UIImageView!
    @IBOutlet private weak var logoImageView: UIImageView!
    
    // MARK: - Props
    fileprivate var output: InitialViewOutput? {
        guard let output = self._output as? InitialViewOutput else { return nil }
        return output
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        self.applyStyles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.output?.prepareApp()
        }
    }
    
    // MARK: - Setup functions
    func setupComponents() {
        self.navigationItem.title = "".loc
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.backgroundImageView.image = AppAssets.appBackground
        self.logoImageView.image = AppAssets.appLogo
    }
    
    func setupActions() { }
    
    func applyStyles() {
        self.view.apply(.backgroundViewStyle())
        self.backgroundImageView.apply(.generalFillStyle())
        self.logoImageView.apply(.generalFillStyle())
    }
    
    // MARK: - InitialViewInput
    override func setupInitialState(with viewModel: ViperViewModel) {
        super.setupInitialState(with: viewModel)
        
        self.setupComponents()
        self.setupActions()
    }
    
}

// MARK: - Actions
extension InitialViewController { }

// MARK: - Animations
extension InitialViewController { }

// MARK: - Module functions
extension InitialViewController { }
