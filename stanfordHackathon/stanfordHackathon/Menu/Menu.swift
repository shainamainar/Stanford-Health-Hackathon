//
//  Menu.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/19/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import Foundation
import UIKit

class Menu: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let blackView = UIView()
    var dashboardController: DashboardController?

    
    //Menu Choices
    let menuOptions: [MenuOption] = {
        //MenuOption(name: "Home", imageName: "homeIcon")
        return [MenuOption(name: "Settings", imageName: "settings"), MenuOption(name: "Logout", imageName: "logout")]
    }()
    
    @objc func displayMenu() {
        
        //Cover the entire window with UIView
        if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            
            //Adding Gesture to View
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleDismiss(_:)))
            blackView.addGestureRecognizer(tap)
            blackView.isUserInteractionEnabled = true
            
            window.addSubview(blackView)
            window.addSubview(menuView)
            
            let width = window.frame.width - 150
            
            //Initial animation size
            menuView.frame = CGRect(x: -width, y: 0, width: width, height: window.frame.height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            //Animate In
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                let width = window.frame.width - 150
                
                
                self.menuView.frame = CGRect(x: 0, y: 0, width: width, height: window.frame.height)
                
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
                let width = window.frame.width - 150
                
                self.menuView.frame = CGRect(x: -width, y: 0, width: 0, height: window.frame.height)
            }
            
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        let menuOption = menuOptions[indexPath.row]
        cell.menuOption = menuOption
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let menuOption = self.menuOptions[indexPath.row]
        
        print(menuOption.name)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 0
            
            if let app = UIApplication.shared.delegate as? AppDelegate, let window = app.window {
                let width = window.frame.width - 150
                
                self.menuView.frame = CGRect(x: -width, y: 0, width: 0, height: window.frame.height)
            }
            
        }) { (completed: Bool) in
            let option = self.menuOptions[indexPath.row]
            
            switch option.name {
            case "Settings":
                print("Going to settings")
                self.dashboardController?.displayController(menuOption: menuOption, view: SettingsView(frame: UIScreen.main.bounds))
            case "Logout":
                print("Going Calendar")
                self.dashboardController?.handleLogout()
            default:
                print("Staying on home page")
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        setUpView()
        setUpCollectionView()

    }
    
    let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "backMenu"), for: UIControlState.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(handleDismiss(_:)), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "No Name"
        text.font =  UIFont(name: "Avenir Next", size: 18.0)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = Color.red
        
        return text
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "blankProfile")
        imageView.layer.masksToBounds = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        
        return imageView
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.red
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    func setUpView() {
        menuView.addSubview(cancelButton)
        menuView.addSubview(profileImageView)
        menuView.addSubview(nameLabel)
        menuView.addSubview(seperatorView)
        
        cancelButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 30).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: menuView.leftAnchor, constant: 10).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        profileImageView.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 30).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        nameLabel.centerXAnchor.constraint(equalTo: menuView.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 15).isActive = true
        
        seperatorView.widthAnchor.constraint(equalTo: menuView.widthAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        seperatorView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15).isActive = true
    }
    
    func setUpCollectionView() {
        menuView.addSubview(collectionView)
        collectionView.setAnchor(top: seperatorView.bottomAnchor, left: menuView.leftAnchor, bottom: menuView.bottomAnchor, right: menuView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuOption: NSObject {
    let name: String
    let imageName: String
    
    init(name: String, imageName: String) {
        self.imageName = imageName
        self.name = name
    }
}

