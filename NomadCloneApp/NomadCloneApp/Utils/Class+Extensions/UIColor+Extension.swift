//
//  UIColor+Extension.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 12/12/21.
//

import UIKit

extension UIColor {
    
    /// Cor padrao para os componentes do app habilitados
    static var nomadYellowColor: UIColor {
        return UIColor(red: .setColor(251), green: .setColor(212),
                       blue: .setColor(5), alpha: 1)
    }
    
    /// Cor padrao para os componentes do app desabilitados
    static var disableButtonColor: UIColor {
        return UIColor.systemGray.withAlphaComponent(0.4)
    }
    
}

