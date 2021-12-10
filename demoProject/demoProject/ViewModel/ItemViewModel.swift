//
//  ItemViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-06.
//

import Foundation
import RxSwift

class ItemViewModel {
    weak var coordinator: ItemCoordinator?
    func login() {
        coordinator?.navigateToCartScreen()
    }
}
protocol ItemCoordinator: AnyObject {
    func navigateToCartScreen()
}
