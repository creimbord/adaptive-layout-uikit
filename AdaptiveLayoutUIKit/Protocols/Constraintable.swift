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
            constraint.adaptConstraint(basedOn: .height)
        }
    }
    
    func setHorizontalConstraints() {
        horizontalConstraints?.forEach { (constraint) in
            constraint.adaptConstraint(basedOn: .width)
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
    
    private func reset(constants: [CGFloat]?, of constraints: [NSLayoutConstraint]?) {
        guard let constants = constants else { return }
        
        constraints?.indices.forEach { (index) in
            constraints?[index].constant = constants[index]
        }
    }
    
    private func resetVerticalConstants() {
        reset(constants: initialConstants?.vertical, of: verticalConstraints)
    }
    
    private func resetHorizontalConstants() {
        reset(constants: initialConstants?.horizontal, of: horizontalConstraints)
    }
}
