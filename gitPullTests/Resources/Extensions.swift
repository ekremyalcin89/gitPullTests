//
//  Extensions.swift
//  gitPullTests
//
//  Created by Ekrem on 5.01.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
