//
//  PasswordViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-05.
//

import Foundation
import RxSwift
class PasswordViewModel : ValidationViewModel {
     
    var errorMessage: String = "Please enter a valid Password"
    
    var data: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable("")
    
    func validateCredentials() -> Bool {
        
        guard validateLength(text: data.value, size: (6,15)) else{
            errorValue.value = errorMessage
            return false;
        }
        
        errorValue.value = ""
        return true
    }
    
    func validateLength(text : String, size : (min : Int, max : Int)) -> Bool{
        return (size.min...size.max).contains(text.count)
    }
}
