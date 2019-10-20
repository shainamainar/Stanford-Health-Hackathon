//
//  Colors.swift
//  stanfordHackathon
//
//  Created by Chandler Long on 10/19/19.
//  Copyright © 2019 C-LongDev. All rights reserved.
//

import Foundation
import UIKit

struct Color {
    
    static var blue: UIColor {
        get {
            return UIColor(red: 47/255, green: 132/255, blue: 207/255, alpha: 1)
        }
    }
    
    static var green: UIColor {
        get {
            return UIColor(red: 53/255, green: 94/255, blue: 59/255, alpha: 1)
        }
    }
    
    static var yellow: UIColor {
        get {
            return UIColor(red: 242/255, green: 169/255, blue: 38/255, alpha: 1)
        }
    }
    
    static var red: UIColor {
        get {
            return UIColor(red: 153/255, green: 0/255, blue: 0/255, alpha: 1)
        }
    }
    
    static var backgroundColor: UIColor {
        get {
            return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        }
    }
}
