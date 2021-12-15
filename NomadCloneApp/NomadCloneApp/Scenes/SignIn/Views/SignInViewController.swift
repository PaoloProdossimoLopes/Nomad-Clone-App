//
//  SignInViewController.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 09/12/21.
//

import UIKit
import SnapKit

final class SignInViewController: NomadCustomViewController {
    
    //MARK: - Properties
    
    var viewModel: SignInViewModelProtocol
    
    //MARK: - UI Components
    
    private lazy var nomadLogo: UIImageView = {
        let image = UIImage(named: "NomadLogoBlack")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
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
    
    private lazy var accessAccountButton: NMDPrimaryButton = {
//        let button = UIButton(type: .system)
        let button = NMDPrimaryButton(buttonTitle: "Acessar conta", defaultStateIsEnable: false)
        button.addTarget(self, action: #selector(AccessAccountHandleAction), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var createAccountLabel: UILabel = {
        let label = UILabel()
        label.text = "Abrir minha conta"
        label.textColor = .black
        label.attributedText = label.text?.underLined
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(createAccountHandleAction))
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [CPFStackView, passswordStackView])
        stack.spacing = 30
        stack.axis = .vertical
        return stack
    }()
    
    //MARK: - Constructor
    
    init(viewModel: SignInViewModelProtocol = SignInViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        configureDelegates()
    }
    
    //MARK: - Helpers
    
    func configureViewHierarchy() {
        
        [nomadLogo, mainStackView, accessAccountButton, createAccountLabel]
            .forEach { view in self.view.addSubview(view) }
        
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
    
    private func configureDelegates() {
        CPFStackView.delegate = self
        passswordStackView.delegate = self
    }
    
    func configureStyle() {
        self.view.backgroundColor = .white
    }
    
    func validateButtonState() {
        let isEnable: Bool = viewModel.buttonIsEnable(tf1: CPFStackView.getTFText(),
                                                      tf2: passswordStackView.getTFText())
        accessAccountButton.changeButtonState(isEnable)
    }
    
    //MARK: - Selectors
    
    @objc private func AccessAccountHandleAction() {
        print("Botao Accessar conta foi clicado")
    }
    
    @objc private func createAccountHandleAction() {
        print("Label criar conta foi clicada")
        let controller = OnboardingViewController()
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        self.present(navigation, animated: true, completion: nil)
    }
    
}

//MARK: - NomadCustomTextFieldStackViewDelegate

extension SignInViewController: NomadCustomTextFieldStackViewDelegate {
    func updateTextField(text: String) {
        validateButtonState()
    }
}
