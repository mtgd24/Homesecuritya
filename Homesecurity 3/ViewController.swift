//
//  ViewController.swift
//  Homesecurity 3
//
//  Created by MTGD on 2025/2/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttontaped(_ sender: Any) {
        
        let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "firstViewController") as! firstViewController
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    @IBAction func test(_ sender: UIButton) {
        showAlert(message: "Please enter both email and password")

    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

