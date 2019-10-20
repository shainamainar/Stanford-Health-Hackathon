//
//  Medication.swift
//  
//
//  Created by Shefali Emmanuel on 10/19/19.
//

import Foundation
import UIKit

class Medication: NSObject {
    var drugName: String?
    var strength: Interger?
    var dosage: Interger?
    var frequency: String?
    var timeOfDosage: String?
    var restrictions: String?
    var adminForm: String?
    
    init(medicationDrugName: String, medicationStrength: Interger, medicationDosage: Interger, medicationFrequency: String, medicationTimeOfDosage: String, medicationRestrictions: String, medicationAdminForm: String) {
        self.drugName = medicationDrugName
        self.strength = vitalsBloodPreasure
        self.dosage = medicationDosage
        self.frequency = medicationFrequency
        self.timeOfDosage = medicationTimeOfDosage
        self.restrictions = medicationRestrictions
        self.adminForm = medicationAdminForm
        
    }
}
