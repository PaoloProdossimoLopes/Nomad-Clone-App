//
//  SignInViewModel.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 13/12/21.
//

import Foundation
import UIKit

protocol SignInViewModelProtocol {
    func changeButtonState(tf1: String, tf2: String) -> (isEnabled: Bool, color: UIColor)
}

final class SignInViewModel: SignInViewModelProtocol {

    private func buttonIsEnable(tf1: String, tf2: String) -> Bool {
        let CPFConditions: Bool = (!tf1.isEmpty)
        let passwordConditions: Bool = (!tf2.isEmpty)
        return CPFConditions && passwordConditions
    }
    
    func changeButtonState(tf1: String, tf2: String) -> (isEnabled: Bool, color: UIColor) {
        let isEnable: Bool = buttonIsEnable(tf1: tf1, tf2: tf2)
        let color: UIColor = isEnable ? .nomadYellowColor : .disableButtonColor
        return (isEnable, color)
    }
    
}
