//
//  LoginViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation
import RxSwift

final class LoginViewModel{
    
    let model : LoginModel = LoginModel()
    let disposebag = DisposeBag()
    let email = ""
    let password = ""
    
    weak var coordinator: LoginCoordinator?
    func login() {
        coordinator?.navigateToItemScreen()
    }
    @objc func loginButtonPressed(){
        if email == "Admin" && password == "123"{
            login()
        } else {
            let alert = UIAlertController(title: "Error", message: "Username or Password is invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Try again!", style: UIAlertAction.Style.default, handler: nil))
        }
    }
//    let emailIdViewModel = "EmailViewModel()"
//    let passwordViewModel = PasswordViewModel()
    
    // Fields that bind to our view's
    let isSuccess : Variable<Bool> = Variable(false)
    let isLoading : Variable<Bool> = Variable(false)
    let errorMsg : Variable<String> = Variable("")
    
//    func validateCredentials() -> Bool{
//        return emailIdViewModel.validateCredentials() && passwordViewModel.validateCredentials();
//    }
    func authenticateuser () {
        
    }
    
//    func loginUser(){
//
//        // Initialise model with filed values
//        model.email = emailIdViewModel.data.value
//        model.password = passwordViewModel.data.value
//
//        self.isLoading.value = true
//
////        let result = Request(email: model.email , password : model.password)
////        ApiService.execute(result)
////            .subscribe(onNext : {response in
////                self.isLoading.value = false
////                self.isSuccess.value = true
////            }, onError : { error in
////                self.isLoading.value = false
////                self.errorMsg.value = error.message
////            }).disposed(by : disposebag)
//    }
}
protocol LoginCoordinator: AnyObject {
    func navigateToItemScreen()
}

protocol ValidationViewModel {
     
    var errorMessage: String { get }
    
    // Observables
    var data: Variable<String> { get set }
    var errorValue: Variable<String?> { get }
    
    // Validation
    func validateCredentials() -> Bool
}
