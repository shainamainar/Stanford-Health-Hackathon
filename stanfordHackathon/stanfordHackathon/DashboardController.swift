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
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .done, target: self, action: #selector(displayMenu))
        self.navigationItem.leftBarButtonItem!.tintColor = UIColor.black
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    func displayController(menuOption: MenuOption, view: UIView) {
        let selectionController = UIViewController()
        selectionController.navigationItem.title = menuOption.name
        selectionController.view.addSubview(view)
        
        navigationController?.navigationBar.tintColor = Color.backgroundColor
        navigationController?.pushViewController(selectionController, animated: true)
        
    }
    
    lazy var menu: Menu = {
        let menuLauncher = Menu()
        menuLauncher.dashboardController = self
        return menuLauncher
    }()
    
    @objc func displayMenu() {
        menu.displayMenu()
    }
    
    @objc func handleLogout() {
        let vc = LoginController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)

    }
    
    func setUpHomeBanner() {
        view.addSubview(scrollView)
        scrollView.addSubview(bannerView)
        bannerView.addSubview(nameLabel)
        bannerView.addSubview(bellIcon)
        bannerView.addSubview(medicineLabelBanner)
        
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 8.0).isActive = true
        scrollView.contentSize = CGSize(width: view.frame.width, height: 700)
    
        bannerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        bannerView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        bannerView.heightAnchor.constraint(equalToConstant: 175).isActive = true
        
        nameLabel.setAnchor(top: bannerView.topAnchor, left: bannerView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 25, paddingBottom: 0, paddingRight: 0)
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        bellIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        bellIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        bellIcon.setAnchor(top: nameLabel.bottomAnchor, left: bannerView.leftAnchor, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 25, paddingBottom: 0, paddingRight: 0)
        
        medicineLabelBanner.setAnchor(top: nameLabel.bottomAnchor, left: bellIcon.rightAnchor, bottom: nil, right: bannerView.rightAnchor, paddingTop: 53, paddingLeft: 20, paddingBottom: 0, paddingRight: 25)
        medicineLabelBanner.heightAnchor.constraint(equalToConstant: 30).isActive = true


    }
    
    func setUpButtons() {
        scrollView.addSubview(dietButton)
        
        // Diet Button
        
        dietButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        dietButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        dietButton.heightAnchor.constraint(equalToConstant: 210).isActive = true
        dietButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100).isActive = true
        
        dietButton.addSubview(dietIcon)
        dietButton.addSubview(dietLabel)
        
        dietIcon.topAnchor.constraint(equalTo: dietButton.topAnchor, constant: 50).isActive = true
        dietIcon.heightAnchor.constraint(equalToConstant: 70).isActive = true
        dietIcon.widthAnchor.constraint(equalToConstant: 55).isActive = true
        dietIcon.centerX(centerX: dietButton.centerXAnchor)

        dietLabel.topAnchor.constraint(equalTo: dietIcon.bottomAnchor, constant: 25).isActive = true
        dietLabel.centerX(centerX: dietIcon.centerXAnchor)
        dietLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // Exercise Button
        
        scrollView.addSubview(exerciseButton)
        
        exerciseButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        exerciseButton.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 25).isActive = true
        exerciseButton.heightAnchor.constraint(equalToConstant: 210).isActive = true
        exerciseButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100).isActive = true
        
        exerciseButton.addSubview(exerciseIcon)
        exerciseButton.addSubview(exerciseLabel)
        
        exerciseIcon.topAnchor.constraint(equalTo: exerciseButton.topAnchor, constant: 50).isActive = true
        exerciseIcon.heightAnchor.constraint(equalToConstant: 60).isActive = true
        exerciseIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        exerciseIcon.centerX(centerX: exerciseButton.centerXAnchor)

        exerciseLabel.topAnchor.constraint(equalTo: exerciseIcon.bottomAnchor, constant: 25).isActive = true
        exerciseLabel.centerX(centerX: exerciseIcon.centerXAnchor)
        exerciseLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        setUpOtherButtons()

    }
    
    
    func setUpOtherButtons() {
        scrollView.addSubview(medicineButton)
        
        medicineButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        medicineButton.topAnchor.constraint(equalTo: dietButton.bottomAnchor, constant: 20).isActive = true
        medicineButton.heightAnchor.constraint(equalToConstant: 210).isActive = true
        medicineButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -100).isActive = true
        
        medicineButton.addSubview(medicineIcon)
        medicineButton.addSubview(medicineLabel)
        
        medicineIcon.topAnchor.constraint(equalTo: medicineButton.topAnchor, constant: 50).isActive = true
        medicineIcon.heightAnchor.constraint(equalToConstant: 73).isActive = true
        medicineIcon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        medicineIcon.centerX(centerX: medicineButton.centerXAnchor)

        medicineLabel.topAnchor.constraint(equalTo: medicineIcon.bottomAnchor, constant: 25).isActive = true
        medicineLabel.centerX(centerX: medicineButton.centerXAnchor)
        medicineLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        scrollView.addSubview(vitalButton)

        
        vitalButton.widthAnchor.constraint(equalToConstant: 175).isActive = true
        vitalButton.topAnchor.constraint(equalTo: exerciseButton.bottomAnchor, constant: 25).isActive = true
        vitalButton.heightAnchor.constraint(equalToConstant: 210).isActive = true
        vitalButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 100).isActive = true
        
        vitalButton.addSubview(vitalIcon)
        vitalButton.addSubview(vitalLabel)

        vitalIcon.topAnchor.constraint(equalTo: vitalButton.topAnchor, constant: 25).isActive = true
        vitalIcon.heightAnchor.constraint(equalToConstant: 95).isActive = true
        vitalIcon.widthAnchor.constraint(equalToConstant: 75).isActive = true
        vitalIcon.centerX(centerX: vitalButton.centerXAnchor)

        vitalLabel.topAnchor.constraint(equalTo: vitalIcon.bottomAnchor, constant: 25).isActive = true
        vitalLabel.centerX(centerX: vitalButton.centerXAnchor)
        vitalLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        
    }
    
    // ************* INTERFACE ************** \\
    
    
    
    let vitalLabel: UILabel = {
        let text = UILabel()
        text.text = "Vitals"
        text.font =  UIFont(name:"Roboto", size: 25.0)
        text.textColor = UIColor.darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let vitalIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vitals")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var vitalButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 38.0)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = false
         button.layer.shadowColor = UIColor.black.cgColor
         button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
         button.layer.shadowRadius = 8
         button.layer.shadowOpacity = 0.5
        
        button.addTarget(self, action: #selector(handleVitals), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleVitals() {
        let alert = UIAlertController(title: "Page unavalible", message: "This page is still under development", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))

        self.present(alert, animated: true)
    }
    
    
    let medicineLabel: UILabel = {
        let text = UILabel()
        text.text = "Medication"
        text.font =  UIFont(name:"Roboto", size: 25.0)
        text.textColor = UIColor.darkGray
        text.translatesAutoresizingMaskIntoConstraints = false
        
        return text
    }()
    
    let  medicineIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pill")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    lazy var  medicineButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 38.0)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = false
         button.layer.shadowColor = UIColor.black.cgColor
         button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
         button.layer.shadowRadius = 8
         button.layer.shadowOpacity = 0.5
        
        button.addTarget(self, action: #selector(handleMedicine), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleMedicine() {
        let diet = MedicationController()
        //let root = UIApplication.shared.keyWindow!.rootViewController!
        modalPresentationStyle = .fullScreen
        present(diet, animated: true, completion: nil)
    }
    
    
    let medicineLabelBanner: UILabel = {
        let text = UILabel()
        text.text = "Its time to take your medication!"
        text.font =  UIFont(name:"Roboto", size: 18.0)
        text.font = UIFont.boldSystemFont(ofSize: 18.0)
        text.textColor = UIColor.darkGray
        
        return text
    }()
    
    let bellIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bell")
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    let exerciseLabel: UILabel = {
        let text = UILabel()
        text.text = "Exercise"
        text.font =  UIFont(name:"Roboto", size: 25.0)
        text.textColor = UIColor.darkGray
        
        return text
    }()
    
    let exerciseIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "weight")
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
        button.layer.masksToBounds = false
         button.layer.shadowColor = UIColor.black.cgColor
         button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
         button.layer.shadowRadius = 8
         button.layer.shadowOpacity = 0.5
        
        button.addTarget(self, action: #selector(handleExercise), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleExercise() {
        
        let diet = ExerciseController()
        //let root = UIApplication.shared.keyWindow!.rootViewController!
        modalPresentationStyle = .fullScreen
        present(diet, animated: true, completion: nil)
    }
    
    let dietLabel: UILabel = {
        let text = UILabel()
        text.text = "Diet"
        text.font =  UIFont(name:"Roboto", size: 25.0)
        text.textColor = UIColor.darkGray
        
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
        button.layer.masksToBounds = false
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.5
        
        
        button.addTarget(self, action: #selector(handleDiet), for: .touchUpInside)
        
        return button
    }()
    
    @objc func handleDiet() {
        
        let diet = DietController()
        //let root = UIApplication.shared.keyWindow!.rootViewController!
        modalPresentationStyle = .fullScreen
        present(diet, animated: true, completion: nil)
    }
    
    let nameLabel: UILabel = {
        let text = UILabel()
        text.text = "Hello, Chandler!"
        text.font =  UIFont(name:"Roboto", size: 32.0)
        text.font = UIFont.boldSystemFont(ofSize: 32.0)
        text.textColor = UIColor.darkGray
        
        return text
    }()
    
    let bannerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.backgroundColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = Color.backgroundColor
        scrollView.showsVerticalScrollIndicator = false
        

        return scrollView
    }()

    
}
