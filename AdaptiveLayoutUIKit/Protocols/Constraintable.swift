//
//  Constraintable.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

protocol Constraintable: AnyObject {
    var initialConstants:      (vertical: [CGFloat], horizontal: [CGFloat])? { get set }
    var verticalConstraints:   [NSLayoutConstraint]? { get }
    var horizontalConstraints: [NSLayoutConstraint]? { get }
    
    func setConstraints()
    func setVerticalConstraints()
    func setHorizontalConstraints()
    
    func saveInitialConstants()
    func resetConstants()
}

// MARK: - Setup constraints
extension Constraintable {
    var verticalConstraints:   [NSLayoutConstraint]? { nil }
    var horizontalConstraints: [NSLayoutConstraint]? { nil }
    
    func setConstraints() {
        setVerticalConstraints()
        setHorizontalConstraints()
    }
    
    func setVerticalConstraints() {
        verticalConstraints?.forEach { (constraint) in
            constraint.adaptConstraint(
                usingScreenSizeOf: .iPhoneSE,
                basedOn: .height
            )
        }
    }
    
    func setHorizontalConstraints() {
        horizontalConstraints?.forEach { (constraint) in
            constraint.adaptConstraint(
                usingScreenSizeOf: .iPhoneSE,
                basedOn: .width
            )
        }
    }
}

// MARK: - Reset constraints constants
extension Constraintable {
    func saveInitialConstants() {
        let verticalConstants   = verticalConstraints?.compactMap { $0.constant }
        let horizontalConstants = horizontalConstraints?.compactMap { $0.constant }
        
        initialConstants = (
            vertical: verticalConstants ?? [],
            horizontal: horizontalConstants ?? []
        )
    }
    
    func resetConstants() {
        resetVerticalConstants()
        resetHorizontalConstants()
    }
    
    private func resetVerticalConstants() {
        guard let verticalConstants = initialConstants?.vertical else { return }
        
        verticalConstraints?.indices.forEach { (index) in
            verticalConstraints?[index].constant = verticalConstants[index]
        }
    }
    
    private func resetHorizontalConstants() {
        guard let horizontalConstants = initialConstants?.horizontal else { return }
        
        horizontalConstraints?.indices.forEach { (index) in
            horizontalConstraints?[index].constant = horizontalConstants[index]
        }
    }
}
