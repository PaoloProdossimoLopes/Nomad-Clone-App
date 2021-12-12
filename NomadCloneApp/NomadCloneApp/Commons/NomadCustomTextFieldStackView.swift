//
//  NomadCustomTextField.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 11/12/21.
//

import UIKit

final class NomadCustomTextFieldStackView: UIStackView {
    
    private let titleStackText: String
    private let placeholderText: String
    private let buttonTitle: String
    
    private let shouldDisplayButton: Bool
    private let isSecure: Bool
    
    private lazy var passswordTitleLabel: UILabel = {
        let label = UILabel()
        label.text = titleStackText
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var passswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = placeholderText
        tf.attributedPlaceholder = NSAttributedString(string: tf.placeholder ?? "",
                                                      attributes: [.foregroundColor: UIColor.gray])
        tf.textColor = .black
        tf.isSecureTextEntry = isSecure
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var passwordTextFieldHStack: UIStackView = {
        let stack = UIStackView()
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
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    init(titleStackText: String, placeholderText: String,
         buttonTitle: String = "", shouldDisplayButton: Bool = false, isSecure: Bool = false) {
        self.titleStackText = titleStackText
        self.placeholderText = placeholderText
        self.buttonTitle = buttonTitle
        self.shouldDisplayButton = shouldDisplayButton
        self.isSecure = isSecure
        super.init(frame: .zero)
        
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension NomadCustomTextFieldStackView: CustomBaseViewLayout {
    
    func configureViewHierarchy() {
        passwordTextFieldHStack.addArrangedSubview(passswordTextField)
        
        if shouldDisplayButton {
            passwordTextFieldHStack.addArrangedSubview(forgotPasswordButton)
        }
        
        addArrangedSubview(passswordTitleLabel)
        addArrangedSubview(passwordTextFieldHStack)
        addArrangedSubview(passswordBottomDividerView)
    }
    
    func configureConstraint() {
        passswordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passswordBottomDividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func configureStyle() {
        spacing = 5
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

