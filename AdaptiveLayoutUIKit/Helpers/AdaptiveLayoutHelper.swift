//
//  AdaptiveLayoutHelper.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

func resized(withScreenSizeOf screenSize: Device, size: CGSize, basedOn dimension: Dimension) -> CGSize {
    let screenWidth  = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var ratio:  CGFloat = 0.0
    var width:  CGFloat = 0.0
    var height: CGFloat = 0.0
    
    switch dimension {
    case .width:
        ratio  = size.height / size.width
        width  = screenWidth * (size.width / screenSize.rawValue.width)
        height = width * ratio
    case .height:
        ratio  = size.width / size.height
        height = screenHeight * (size.height / screenSize.rawValue.height)
        width  = height * ratio
    }
    
    return CGSize(width: width, height: height)
}

func adapted(withScreenSizeOf screenSize: Device, dimensionSize: CGFloat, to dimension: Dimension) -> CGFloat {
    let screenWidth  = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var ratio: CGFloat = 0.0
    var resultDimensionSize: CGFloat = 0.0
    
    switch dimension {
    case .width:
        ratio = dimensionSize / screenSize.rawValue.width
        resultDimensionSize = screenWidth * ratio
    case .height:
        ratio = dimensionSize / screenSize.rawValue.height
        resultDimensionSize = screenHeight * ratio
    }
    
    return resultDimensionSize
}
