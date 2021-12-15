//
//  SignInViewModel.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 13/12/21.
//

import Foundation
import UIKit

protocol SignInViewModelProtocol {
    func buttonIsEnable(tf1: String, tf2: String) -> Bool
}

final class SignInViewModel: SignInViewModelProtocol {

    func buttonIsEnable(tf1: String, tf2: String) -> Bool {
        let CPFConditions: Bool = (!tf1.isEmpty)
        let passwordConditions: Bool = (!tf2.isEmpty)
        return CPFConditions && passwordConditions
    }
    
}
