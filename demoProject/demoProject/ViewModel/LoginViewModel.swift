//
//  LoginViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation
import RxSwift

final class LoginViewModel {
    let model : LoginModel = LoginModel()
    let disposebag = DisposeBag()
    
    weak var coordinator: LoginCoordinator?
    func login() {
        coordinator?.navigateToItemScreen()
    }
}

protocol LoginCoordinator: AnyObject {
    func navigateToItemScreen()
}

