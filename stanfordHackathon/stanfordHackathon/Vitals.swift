//
//  Vitals.swift
//  
//
//  Created by Shefali Emmanuel on 10/19/19.
//

import Foundation
import UIKit

class Vitals: NSObject {
    var glusoseLevel: Float?
    var bloodPreasure: Interger?
    
    init(vitalsGlusoseLevel: Float, vitalsBloodPreasure: Interger) {
        self.glusoseLevel = vitalsGlusoseLevel
        self.bloodPreasure = vitalsBloodPreasure
    }
}
