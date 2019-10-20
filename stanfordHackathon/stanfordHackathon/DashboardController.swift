//
//  DashboardController.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/19/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import UIKit
<<<<<<< HEAD
import StitchCore
import StitchRemoteMongoDBService
=======
>>>>>>> origin/master

class DashboardController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavigationBar()
<<<<<<< HEAD
        
        mongoClient()
    }

    private lazy var stitchClient = Stitch.defaultAppClient!
    
    func mongoClient(){
        let client = Stitch.defaultAppClient!

        print("logging in anonymously")
        client.auth.login(withCredential: AnonymousCredential()) { result in
                switch result {
                case .success(let user):
                    print("logged in anonymous as user \(user.id)")
                    DispatchQueue.main.async {
                        // update UI accordingly
                    }
                case .failure(let error):
                    print("Failed to log in: \(error)")
                }
            }
    }
    
=======
    }

>>>>>>> origin/master
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
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
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}
