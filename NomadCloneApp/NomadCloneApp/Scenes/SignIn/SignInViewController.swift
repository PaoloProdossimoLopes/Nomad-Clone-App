//
//  SignInViewController.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 09/12/21.
//

import UIKit

final class SignInViewController: NomadCustomViewController {
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = {
        let image = UIImage(named: "NomadLogoBlack")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var CPFStackView = NomadCustomTextFieldStackView(
        titleStackText: "Insira seu CPF",
        placeholderText: "Seu CPF"
    )
    
    private lazy var passswordStackView = NomadCustomTextFieldStackView(
        titleStackText: "Insira sua senha de 8 caracteres",
        placeholderText: "Sua senha",
        buttonTitle: "Esquceu?",
        shouldDisplayButton: true
    )
    
    private lazy var accessAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Acessar conta", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor.systemGray.withAlphaComponent(0.4)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrir minha conta"
        label.textColor = .black
        label.attributedText = NSAttributedString(string: label.text ?? "", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFStackView, passswordStackView])
        stack.spacing = 30
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
    
    //MARK: - Helpers
    
    func configureViewHierarchy() {
        
        [nomadLogo, mainStackView, accessAccountButton, createAccountLabel].forEach { view in
            self.view.addSubview(view)
        }
        
    }
    
    func configureConstraint() {
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        createAccountLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        createAccountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        accessAccountButton.bottomAnchor.constraint(equalTo: createAccountLabel.topAnchor, constant: -20).isActive = true
        accessAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        accessAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        accessAccountButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configureStyle() {
        self.view.backgroundColor = .white
    }
}



//extension String {
//
//    var underLined: NSAttributedString {
//        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
//    }
//
//}
