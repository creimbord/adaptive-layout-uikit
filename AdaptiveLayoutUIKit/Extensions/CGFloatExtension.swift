//
//  CGFloatExtension.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

extension CGFloat {
    var adaptedFontSize: CGFloat {
        adapted(withScreenSizeOf: .iPhoneSE, dimensionSize: self, to: dimension)
    }
}
