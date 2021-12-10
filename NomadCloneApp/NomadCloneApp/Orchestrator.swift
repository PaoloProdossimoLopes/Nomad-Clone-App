//
//  Orchestrator.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 09/12/21.
//

import UIKit

final class Orchestrator: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OperationQueue.main.addOperation { [weak self] in
            self?.goToSignIn()
        }
        
    }
    
    private func goToSignIn() {
        let viewController = SignInViewController()
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true, completion: nil)
    }
    
}
