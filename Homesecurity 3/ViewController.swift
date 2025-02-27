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
    
}

