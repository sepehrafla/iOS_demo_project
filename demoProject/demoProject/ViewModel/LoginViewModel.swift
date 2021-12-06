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
    
    weak var coordinator: LoginCoordinator?
    func login() {
        coordinator?.navigateToItemScreen()
    }
    let emailIdViewModel = EmailViewModel()
    let passwordViewModel = PasswordViewModel()
    
    // Fields that bind to our view's
    let isSuccess : Variable<Bool> = Variable(false)
    let isLoading : Variable<Bool> = Variable(false)
    let errorMsg : Variable<String> = Variable("")
    
    func validateCredentials() -> Bool{
        return emailIdViewModel.validateCredentials() && passwordViewModel.validateCredentials();
    }
    
    func loginUser(){
        
        // Initialise model with filed values
        model.email = emailIdViewModel.data.value
        model.password = passwordViewModel.data.value
        
        self.isLoading.value = true
        
//        let result = Request(email: model.email , password : model.password)
//        ApiService.execute(result)
//            .subscribe(onNext : {response in
//                self.isLoading.value = false
//                self.isSuccess.value = true
//            }, onError : { error in
//                self.isLoading.value = false
//                self.errorMsg.value = error.message
//            }).disposed(by : disposebag)
    }
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
