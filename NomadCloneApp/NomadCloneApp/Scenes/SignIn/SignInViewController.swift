//
//  SignInViewController.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 09/12/21.
//

import UIKit

final class SignInViewController: UIViewController {
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = {
        let image = UIImage(named: "NomadLogoBlack")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - Helpers
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstrints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        view.addSubview(nomadLogo)
    }
    
    private func configureConstrints() {
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func configureStyle() {
        self.view.backgroundColor = .white
    }
    
}
