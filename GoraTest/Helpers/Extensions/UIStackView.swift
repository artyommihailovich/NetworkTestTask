//
//  UIStackView.swift
//  GoraTest
//
//  Created by Artyom Mihailovich on 6/6/21.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(addArrangedSubview)
    }
}
