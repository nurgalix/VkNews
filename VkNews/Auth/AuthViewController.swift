//
//  ViewController.swift
//  VkNews
//
//  Created by Nurgali on 04.07.2024.
//

import UIKit

class AuthViewController: UIViewController {
    
    private var authService: AuthService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        authService = SceneDelegate.shared().authService
        view.backgroundColor = .red
    }

    @IBAction func signInButton(_ sender: UIButton) {
        authService.wakeUpSession()
    }
    
}

