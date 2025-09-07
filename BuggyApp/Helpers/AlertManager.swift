//
//  AlertManager.swift
//  BuggyApp
//
//  Created by Eren Korkmaz on 2.09.2025.
//


import UIKit

final class AlertManager {
    static let shared = AlertManager()
    
    private init() {}
    
    func showAlert(
        on viewController: UIViewController,
        title: String,
        message: String,
        buttonTitle: String = "Tamam",
        completion: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            completion?()
        }
        alert.addAction(action)
        viewController.present(alert, animated: true)
    }
}
