//
//  NSLayoutConstraintExtension.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func adaptConstraint(basedOn dimension: Dimension) {
        self.constant = adapted(dimensionSize: self.constant, to: dimension)
    }
}
