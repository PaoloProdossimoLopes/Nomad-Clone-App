//
//  String+Extensions.swift
//  NomadCloneApp
//
//  Created by Paolo Prodossimo Lopes on 12/12/21.
//

import UIKit

extension String {

    var underLined: NSAttributedString {
        NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }

}

