//
//  CustomBaseViewLayout.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 11/12/21.
//

import UIKit

typealias NomadCustomViewController = (UIViewController & CustomBaseViewLayout)
typealias NomadCustomView = (UIView & CustomBaseViewLayout)

protocol CustomBaseViewLayout {
    func configureViewHierarchy()
    func configureConstraint()
    func configureStyle()
}

extension CustomBaseViewLayout {
    func commonInit() {
        configureViewHierarchy()
        configureConstraint()
        configureStyle()
    }
    
    func configureStyle() {}
}
