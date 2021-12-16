//
//  ItemViewModel.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-06.
//

import Foundation
import RxSwift

class ItemViewModel {
    let disposeBag = DisposeBag()
    weak var coordinator: ItemCoordinator?
    private var cartButton = UIBarButtonItem()
    func login() {
        coordinator?.navigateToCartScreen()
    }
    func goBack() {
        ShoppingCart.sharedCart.cars.accept([])
        coordinator?.navigateToCartScreen()
    }
    func setupCartObserver() {
      ShoppingCart.sharedCart.cars.asObservable()
        .subscribe(onNext: { [unowned self] setOfCars in
            self.cartButton.title = "\u{1F6D2} (\(setOfCars.count))"
            print(setOfCars.count)
        })
        .disposed(by: disposeBag)
    }
}
protocol ItemCoordinator: AnyObject {
    func navigateToCartScreen()
}
