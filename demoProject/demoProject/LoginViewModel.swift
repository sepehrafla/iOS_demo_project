//
//  LoginViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation

final class LoginViewModel {
    weak var coordinator: LoginCoordinator?
    func login() {
        coordinator?.navigateToItemScreen()
    }
}

protocol LoginCoordinator: AnyObject {
    func navigateToItemScreen()
}

