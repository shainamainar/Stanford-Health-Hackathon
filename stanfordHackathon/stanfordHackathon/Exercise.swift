//
//  Exercise.swift
//  
//
//  Created by Shefali Emmanuel on 10/19/19.
//

import Foundation
import UIKit

class Exercise:NSObject {
    var frequency: String?
    var type: String?
    var intensity: Interger?
    var time: String?
    
    init( exerciseFrequency: String, excerciseType: String, exerciseIntensity: Interger, exerciseTime: String) {
        self.frequency = exerciseFrequency
        self.type = excerciseType
        self.intensity = exerciseIntensity
        self.time = exerciseTime
    }
}
