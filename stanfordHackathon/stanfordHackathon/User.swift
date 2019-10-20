//
//  User.swift
//  
//
//  Created by Shefali Emmanuel on 10/19/19.
//

import Foundation
import UIKit

class User: NSObject {
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    var birthday: String?
    var age: Interger?
    var weight: Interger?
    var address: String?
    var primeLogin: String?
    var primePassword: String?
    var allergies: String?
    var intolerances: String?
    
    init(userFirstName: String, userLasrName: String, userEmail: String, userPassword: String, userBirthday: String, userAge: Interger, userWeight: Interger, userAddress: String, userPrimeLogin: String, userPrimePassword: String, userAllergies: String, userIntolerances: String){
        self.firstName = userFirstName
        self.lastName = userLasrName
        self.email = userEmail
        self.password = userPassword
        self.birthday = userBirthday
        self.age = userAge
        self.weight = userWeight
        self.address = userAddress
        self.primeLogin = userPrimeLogin
        self.primePassword = userPrimePassword
        self.allergies = userAllergies
        self.intolerances = userIntolerances
    }
}
