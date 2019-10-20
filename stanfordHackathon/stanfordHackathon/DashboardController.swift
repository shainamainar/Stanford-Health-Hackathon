//
//  DashboardController.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/19/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import UIKit

class DashboardController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
        setUpHomeBanner()
        setUpButtons()
        
    }
    
    func setUpNavigationBar() {
        navigationItem.title = "Dashboard"
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(displayMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleLogout))

    }
    
    func displayController(menuOption: MenuOption, view: UIView) {
        let selectionController = UIViewController()
        selectionController.navigationItem.title = menuOption.name
        selectionController.view.addSubview(view)
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.pushViewController(selectionController, animated: true)
        
    }
    
    lazy var menu: Menu = {
        let menuLauncher = Menu()
        menuLauncher.dashboardController = self
        //menuLauncher.profileImageView.image =
        return menuLauncher
    }()
    
    @objc func displayMenu() {
        menu.displayMenu()
    }
    
    @objc func handleLogout() {
//        do {
//            try Auth.auth().signOut()
//        } catch let logoutError {
//            print(logoutError)
//        }
        //let loginController = LoginController()
        let vc = LoginController()
        vc.modalPresentationStyle = .fullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)

    }
    
    func setUpHomeBanner() {
        view.addSubview(scrollView)
        scrollView.addSubview(bannerView)
        bannerView.addSubview(nameLabel)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8.0).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: 700)
    
        bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        bannerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: 225).isActive = true
        
        nameLabel.setAnchor(top: bannerView.topAnchor, left: bannerView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 25, paddingBottom: 0, paddingRight: 0)
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true

    }
    
    func setUpButtons() {
        scrollView.addSubview(dietButton)
        
        // Diet Button
        
        dietButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        dietButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        dietButton.heightAnchor.constraint(equalToConstant: 225).isActive = true
        dietButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100).isActive = true
        
        dietButton.addSubview(dietIcon)
        dietButton.addSubview(dietLabel)
        
        dietIcon.topAnchor.constraint(equalTo: dietButton.topAnchor, constant: 25).isActive = true
        dietIcon.heightAnchor.constraint(equalToConstant: 95).isActive = true
        dietIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        dietIcon.centerX(centerX: dietButton.centerXAnchor)

        dietLabel.topAnchor.constraint(equalTo: dietIcon.bottomAnchor, constant: 25).isActive = true
        dietLabel.centerX(centerX: dietIcon.centerXAnchor)
        dietLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Exercise Button
        
        scrollView.addSubview(exerciseButton)
        
        exerciseButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        exerciseButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        exerciseButton.heightAnchor.constraint(equalToConstant: 225).isActive = true
        exerciseButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100).isActive = true
        
        exerciseButton.addSubview(exerciseIcon)
        exerciseButton.addSubview(exerciseLabel)
        
        exerciseIcon.topAnchor.constraint(equalTo: exerciseButton.topAnchor, constant: 25).isActive = true
        exerciseIcon.heightAnchor.constraint(equalToConstant: 95).isActive = true
        exerciseIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        exerciseIcon.centerX(centerX: exerciseButton.centerXAnchor)

        exerciseLabel.topAnchor.constraint(equalTo: exerciseIcon.bottomAnchor, constant: 25).isActive = true
        exerciseLabel.centerX(centerX: exerciseIcon.centerXAnchor)
        exerciseLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        //setUpOtherButtons()

    }
    
    
    func setUpOtherButtons() {
        
        // Diet Button
        
        dietButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        dietButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        dietButton.heightAnchor.constraint(equalToConstant: 225).isActive = true
        dietButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100).isActive = true
        
        dietButton.addSubview(dietIcon)
        dietButton.addSubview(dietLabel)
        
        dietIcon.topAnchor.constraint(equalTo: dietButton.topAnchor, constant: 25).isActive = true
        dietIcon.heightAnchor.constraint(equalToConstant: 95).isActive = true
        dietIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        dietIcon.centerX(centerX: dietButton.centerXAnchor)

        dietLabel.topAnchor.constraint(equalTo: dietIcon.bottomAnchor, constant: 25).isActive = true
        dietLabel.centerX(centerX: dietIcon.centerXAnchor)
        dietLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Exercise Button
        
        scrollView.addSubview(exerciseButton)
        
        exerciseButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        exerciseButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        exerciseButton.heightAnchor.constraint(equalToConstant: 225).isActive = true
        exerciseButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100).isActive = true
        
        exerciseButton.addSubview(exerciseIcon)
        exerciseButton.addSubview(exerciseLabel)
        
        exerciseIcon.topAnchor.constraint(equalTo: exerciseButton.topAnchor, constant: 25).isActive = true
        exerciseIcon.heightAnchor.constraint(equalToConstant: 95).isActive = true
        exerciseIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        exerciseIcon.centerX(centerX: exerciseButton.centerXAnchor)

        exerciseLabel.topAnchor.constraint(equalTo: exerciseIcon.bottomAnchor, constant: 25).isActive = true
        exerciseLabel.centerX(centerX: exerciseIcon.centerXAnchor)
        exerciseLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    // ************* INTERFACE ************** \\
    
    
    
    let exerciseLabel: UILabel = {
        let text = UILabel()
        text.text = "Exercise"
        text.font =  UIFont(name: "Avenir Next", size: 24.0)
        text.textColor = Color.red
        
        return text
    }()
    
    let exerciseIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diet")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var exerciseButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 38.0)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        //button.addTarget(self, action: #selector(handleGoToRegister), for: .touchUpInside)
        
        return button
    }()
    
    let dietLabel: UILabel = {
        let text = UILabel()
        text.text = "Diet"
        text.font =  UIFont(name: "Avenir Next", size: 24.0)
        text.textColor = Color.red
        
        return text
    }()
    
    let dietIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "diet")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var dietButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 38.0)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        
        //button.addTarget(self, action: #selector(handleGoToRegister), for: .touchUpInside)
        
        return button
    }()
    
    let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "Hello, Chandler!"
        text.font =  UIFont(name: "Avenir Next", size: 24.0)
        text.textColor = Color.red
        
        return text
    }()
    
    let bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.blue
        scrollView.showsVerticalScrollIndicator = false
        

        return scrollView
    }()

    
}
