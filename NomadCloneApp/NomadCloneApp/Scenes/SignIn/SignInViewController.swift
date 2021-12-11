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
    
    private lazy var CPFTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Insira seu CPF"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var CPFTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Seu CPF"
        tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "", attributes: [.foregroundColor: UIColor.gray])
        tf.textColor = .black
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var CPFBottomDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var CPFStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var passswordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Insira sua senha de 8 caracteres"
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var passswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Sua senha"
        tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "",
                                                      attributes: [.foregroundColor: UIColor.gray])
        tf.textColor = .black
        tf.isSecureTextEntry = true
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var passwordTextFieldHStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [passswordTextField, forgotPasswordButton])
        stack.axis = .horizontal
        return stack
    }()
    
    private lazy var passswordBottomDividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Esqueceu?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var passswordStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 5
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
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
    
    private func commonInit() {
        configureViewHierarchy()
        configureConstrints()
        configureStyle()
    }
    
    private func configureViewHierarchy() {
        view.addSubview(nomadLogo) // adicionando o logo na tela
        
        CPFStackView.addArrangedSubview(CPFTitleLabel) // add label na stack
        CPFStackView.addArrangedSubview(CPFTextField) // add tf na stack
        CPFStackView.addArrangedSubview(CPFBottomDividerView) // add divider na stack
//        view.addSubview(CPFStackView) // add a stack na tela
        
        passswordStackView.addArrangedSubview(passswordTitleLabel) // add label na stack
        passswordStackView.addArrangedSubview(passwordTextFieldHStack) // add tf na stack
        passswordStackView.addArrangedSubview(passswordBottomDividerView) // add divider na stack
//        view.addSubview(passswordStackView) // add a stack na tela
        view.addSubview(mainStackView) //add a main stack na tela
        
        view.addSubview(accessAccountButton) // add botao na tela
        view.addSubview(createAccountLabel) // add label na tela
        
    }
    
    private func configureConstrints() {
        nomadLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                       constant: 20).isActive = true
        nomadLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nomadLogo.widthAnchor.constraint(equalToConstant: 120).isActive = true
        nomadLogo.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        CPFTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CPFBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        passswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passswordBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
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
    
    private func configureStyle() {
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
