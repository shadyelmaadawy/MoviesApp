//
//  SplashScreenViewController.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 24/01/2023.
//

import UIKit

final class SplashScreenViewController: BaseUIViewController {
    
    private let logoImageView: BaseUIImageView = {
        let baseImageView = BaseUIImageView()
        baseImageView.contentMode = .scaleAspectFit
        baseImageView.image = UIImage(named: UIImage.baseImageNames.logo.rawValue)
        return baseImageView
    }()
    
    private var loadingLabel: BaseUILabel = {
        let baseLabel = BaseUILabel(style: .secondary)
        baseLabel.text = "Loading.."
        baseLabel.textAlignment = .center
        return baseLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLogo()
        setupLabel()
    }
    
    func setupLogo() {
        self.view.addSubview(logoImageView)
        let logoConstraints = [
            self.logoImageView.centerXAnchor.constraint(equalTo: self.safeArea.centerXAnchor),
            self.logoImageView.centerYAnchor.constraint(equalTo: self.safeArea.centerYAnchor),
        ]
        NSLayoutConstraint.activate(logoConstraints)
    }
    
    func setupLabel() {
        self.view.addSubview(loadingLabel)
        let labelConstraints = [
            loadingLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 5),
            loadingLabel.leadingAnchor.constraint(equalTo: self.safeArea.leadingAnchor, constant: 5),
            loadingLabel.trailingAnchor.constraint(equalTo: self.safeArea.trailingAnchor, constant: -5)
        ]
        NSLayoutConstraint.activate(labelConstraints)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.logoImageView.layer.add(.fadeInOutAnimation, forKey: "opacity")
        self.loadingLabel.layer.add(.fadeInOutAnimation, forKey: "opacity")
    }
}
