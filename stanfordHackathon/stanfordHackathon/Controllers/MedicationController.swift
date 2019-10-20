//
//  MedicationController.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/20/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import UIKit

class MedicationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        var imageView = UIImageView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height)); // set as you want
        var image = UIImage(named: "medicine.png");
        imageView.image = image;
        self.view.addSubview(imageView);
                        
    }

}
