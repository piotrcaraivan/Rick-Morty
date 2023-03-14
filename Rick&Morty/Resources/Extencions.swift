//
//  Extencions.swift
//  Rick&Morty
//
//  Created by Петр Караиван on 12.03.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
