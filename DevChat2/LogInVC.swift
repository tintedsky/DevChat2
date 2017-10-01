//
//  LogInVC.swift
//  DevChat2
//
//  Created by Hongbo Niu on 2017-09-30.
//  Copyright © 2017 Udemy. All rights reserved.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var emailField: RoundTextField!
    @IBOutlet weak var passwordField: RoundTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: Any) {
        if let email = emailField.text, let pass = passwordField.text, email.characters.count > 0 && pass.characters.count > 0 {
            // Call the login service
            
        }else{
            let alert = UIAlertController(title: "Username and Password Required", message: "You must enter both an username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
