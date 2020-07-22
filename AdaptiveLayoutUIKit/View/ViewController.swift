//
//  ViewController.swift
//  AdaptiveLayoutUIKit
//
//  Created by Родион on 11.07.2020.
//  Copyright © 2020 Trinity Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Constraintable {
    
    // MARK: - Properties
    var initialConstants: (vertical: [CGFloat], horizontal: [CGFloat])?
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Views
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveInitialConstants()
        setupViews()
        setupButtonConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupFonts()
        resetConstants()
        setupConstraints()
    }
    
    // MARK: - Constraints
    @IBOutlet var verticalConstraints: [NSLayoutConstraint]?
    
    // MARK: - Programmatic constraints
    var heightConstraint = NSLayoutConstraint()
    var widthConstraint  = NSLayoutConstraint()
    var topConstraint    = NSLayoutConstraint()
    var centerConstraint = NSLayoutConstraint()
}

// MARK: - Actions
private extension ViewController {
    @objc func openWikipedia() {
        let link = "https://en.wikipedia.org/wiki/Black_Square_(painting)"
        guard let url = URL(string: link) else { return }
        UIApplication.shared.open(url)
    }
}

// MARK: - Setup views
private extension ViewController {
    func setupViews() {
        setupLearnMoreButton()
    }
    
    func setupFonts() {
        titleLabel.font = HelveticaNeue.bold(size: 20)
        subtitleLabel.font = HelveticaNeue.regular(size: 14)
        button.titleLabel?.font = HelveticaNeue.regular(size: 16)
    }
    
    func setupLearnMoreButton() {
        button.setTitle("Learn more", for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = cornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openWikipedia), for: .touchUpInside)
        view.addSubview(button)
    }
}

// MARK: - Setup constraints
private extension ViewController {
    func setupConstraints() {
        setVerticalConstraints()
        updateButtonConstraints()
    }
    
    var buttonSize: CGSize {
        resized(size: CGSize(width: 200, height: 44), basedOn: .height)
    }
    
    var topSpace: CGFloat {
        adapted(dimensionSize: 30, to: .height)
    }
    
    var cornerRadius: CGFloat {
        adapted(dimensionSize: 8, to: dimension)
    }
    
    func setupButtonConstraints() {
        widthConstraint  = button.widthAnchor.constraint(equalToConstant: buttonSize.width)
        heightConstraint = button.heightAnchor.constraint(equalToConstant: buttonSize.height)
        topConstraint    = button.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: topSpace)
        centerConstraint = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        widthConstraint.isActive  = true
        heightConstraint.isActive = true
        topConstraint.isActive    = true
        centerConstraint.isActive = true
    }
    
    func updateButtonConstraints() {
        topConstraint.constant    = topSpace
        widthConstraint.constant  = buttonSize.width
        heightConstraint.constant = buttonSize.height
        button.layer.cornerRadius = cornerRadius
    }
}
