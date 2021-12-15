//
//  NMDPrimaryButton.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 14/12/21.
//

import UIKit

final class NMDPrimaryButton: UIButton {
    
    private let buttonTitle: String
    private let defaultStateIsEnable: Bool
    
    init(buttonTitle: String, defaultStateIsEnable: Bool = true) {
        self.buttonTitle = buttonTitle
        self.defaultStateIsEnable = defaultStateIsEnable
        super.init(frame: .zero)
        
        configureStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStyle() {
        setTitle(buttonTitle, for: .normal)
        setTitleColor(.black, for: .normal)
        backgroundColor = defaultStateIsEnable ? .nomadYellowColor : .disableButtonColor
        layer.cornerRadius = 8
        isEnabled = defaultStateIsEnable
    }
    
    func changeButtonState(_ isEnable: Bool) {
        let color: UIColor = isEnable ? .nomadYellowColor : .disableButtonColor
        self.isEnabled = isEnable
        self.backgroundColor = color
    }
    
}
