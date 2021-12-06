//
//  EmailViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-05.
//

import Foundation
import RxSwift

class EmailViewModel : ValidationViewModel{
     
    var errorMessage: String = "Please enter a valid Email Id"
    
    var data: Variable<String> = Variable("")
    var errorValue: Variable<String?> = Variable("")
    
    func validateCredentials() -> Bool {
        
        guard validatePattern(text: data.value) else {
            errorValue.value = errorMessage
            return false
        }
        
        errorValue.value = ""
        return true
    }
    
    func validatePattern(text : String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
}
