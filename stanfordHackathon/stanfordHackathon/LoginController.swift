//
//  LoginController.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/19/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = Color.red
        setUpViews()
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        //button.backgroundColor = UIColor(white: 1, alpha: 0.1)
        button.backgroundColor = Color.blue

        button.setTitle("Login", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font =  UIFont(name: "AvenirNext", size: 20)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        //button.layer.borderWidth = 2.0
        //button.layer.borderColor = UIColor.white.cgColor
        
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        
        return button
    }()
    
    func setUpViews() {
        view.addSubview(loginButton)
//        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        loginButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc func handleSignIn() {
        let root = UIApplication.shared.keyWindow!.rootViewController!
        root.dismiss(animated: true, completion: nil)
    }
}
