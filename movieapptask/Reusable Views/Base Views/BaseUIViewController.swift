//
//  BaseUIViewController.swift
//  movieapptask
//
//  Created by Shady K. Maadawy on 15/01/2023.
//

import UIKit

protocol BaseUIViewControllerDelegates: AnyObject {
    func setTitle(_ title: String)
    func showError(withError baseError: Error, dismissView: Bool)
}

class BaseUIViewController: UIViewController, BaseUIViewControllerDelegates {
    
    // MARK: Enums
    
    enum viewControllerPriority {
        case main
        case secondary
    }
    
    enum baseViewControllerTitles: String {
        case home = "Home"
        case details = "Loading.."
    }
    
    // MARK: - Properties
    
    lazy var safeArea: UILayoutGuide = {
        return self.view.safeAreaLayoutGuide
    }()
    
    private let viewPriority: viewControllerPriority
    
    
    /// Initialization of instance.
    /// - Parameter viewPriority: it's optional Parameter, with default arguments as secondary view, that's control the background color of view
    init(viewPriority: viewControllerPriority = .secondary) {
        self.viewPriority = viewPriority
        super.init(nibName: nil, bundle: nil)
        self.setupViewController()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit \(Self.reuseableIdentifier)")
    }
    
    /// Setup view controller
    private func setupViewController() {
        switch(self.viewPriority) {
            case .main:
                self.view.backgroundColor = .mainColor
            case .secondary:
                self.view.backgroundColor = .secondaryColor
        }
    }
    
    func setTitle(_ baseTitle: baseViewControllerTitles) {
        self.title = baseTitle.rawValue
    }
    
    func setTitle(_ title: String) {
        self.title = title
    }
    
    func showError(withError baseError: Error, dismissView: Bool = false) {
        let alertViewController = UIAlertController(title: "An error occurred", message: baseError.localizedDescription, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] _ in
            if(dismissView) {
                self?.navigationController?.popViewController(animated: true)
            }
        }))
        self.present(alertViewController, animated: true)
    }
    

}



