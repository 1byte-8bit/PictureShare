//
//  SplashViewController.swift
//  PictureShare
//
//  Created by Alexandr on 27.11.2023.
//

import UIKit

class SplashViewController: UIViewController {
    
    let ShowAuthenticationScreenSegueIdentifier = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let token = OAuth2TokenStorage().token {
            
        } else {
            performSegue(withIdentifier: ShowAuthenticationScreenSegueIdentifier, sender: nil)
        }
    }
}
