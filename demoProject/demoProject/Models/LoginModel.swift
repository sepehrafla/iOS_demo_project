//
//  LoginModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-05.
//

import Foundation
class LoginModel {
    
    var email = ""
    var password = ""
    
    convenience init(email : String, password : String) {
        self.init()
        self.email = email
        self.password = password
    }
}

