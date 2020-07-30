//
//  UIViewExtension.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 30.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

extension UIView {
    func updateAdaptedConstraints() {
        let adaptedConstraints = constraints.filter { (constraint) -> Bool in
            return constraint is AdaptedConstraint
        } as! [AdaptedConstraint]
        
        for constraint in adaptedConstraints {
            constraint.resetConstant()
            constraint.awakeFromNib()
        }
    }
}
