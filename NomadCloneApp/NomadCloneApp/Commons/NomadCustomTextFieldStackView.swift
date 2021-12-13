//
//  NomadCustomTextField.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 11/12/21.
//

import UIKit

protocol NomadCustomTextFieldStackViewDelegate: AnyObject {
    func updateTextField(text: String)
}

final class NomadCustomTextFieldStackView: UIStackView {
    
    //MARK: - Properties
    
    weak var delegate: NomadCustomTextFieldStackViewDelegate?
    
    private let titleStackText: String
    private let placeholderText: String
    private let buttonTitle: String
    
    private let shouldDisplayButton: Bool
    private let isSecure: Bool
    
    //MARK: - UI Components
    
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
        tf.delegate = self
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
        return view
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(buttonTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    //MARK: - Contructor
    
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
    
    func getTFText() -> String {
        return passswordTextField.text ?? ""
    }
    
}

//MARK: - CustomBaseViewLayout

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
        passswordTextField.snp.makeConstraints { $0.height.equalTo(50) }
        passswordBottomDividerView.snp.makeConstraints { $0.height.equalTo(1) }
        forgotPasswordButton.snp.makeConstraints { $0.width.equalTo(100) }
    }
    
    func configureStyle() {
        spacing = 5
        axis = .vertical
    }
    
}

extension NomadCustomTextFieldStackView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.updateTextField(text: textField.text ?? "")
    }
    
}

