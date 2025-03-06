//
//  LoginViewController.swift
//  Homesecurity 3
//
//  Created by lester on 2025/3/3.
//

import UIKit


class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            // Show alert for invalid input
            showAlert(message: "Please enter both email and password")
            return
        }
        
        // Show loading indicator
        activityIndicator.startAnimating()
        loginButton.isEnabled = false
        
        // Call login API
        // Example with a login call
        APIService.shared.login(email: emailTextField.text!, password: passwordTextField.text!) { (result: Result<LoginResponse, RequestError>) in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Handle success
                    KeychainManager.shared.saveAuthToken(response.token)
                    self.performSegue(withIdentifier: "LoginToDashboard", sender: self)
                case .failure(let error):
                    // Handle error
                    self.showAlert(message: error.localizedDescription)
                }
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
