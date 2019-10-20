//
//  Diet.swift
//  
//
//  Created by Shefali Emmanuel on 10/19/19.
//

import Foundation
import UIKit

class Diet:NSObject {
    var breakfast: String?
    var lunch: String?
    var dinner: String?
    var other: String?
    
    init( dietBreakfast: String, dietLunch: String, dietDinner: String, dietOther: String) {
        self.breakfast = dietBreakfast
        self.lunch = dietLunch
        self.dinner = dietDinner
        self.other = dietOther
    }
}
