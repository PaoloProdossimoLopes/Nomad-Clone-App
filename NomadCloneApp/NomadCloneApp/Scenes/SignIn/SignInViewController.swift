//
//  SignInViewController.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 09/12/21.
//

import UIKit
import SnapKit

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
        shouldDisplayButton: true,
        isSecure: true
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
        
        nomadLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.centerY)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        createAccountLabel.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-15)
            $0.centerX.equalTo(view.snp.centerX)
        }
        
        accessAccountButton.snp.makeConstraints {
            $0.bottom.equalTo(createAccountLabel.snp.top).offset(-20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(50)
        }
        
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
