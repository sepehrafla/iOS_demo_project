//
//  CartViewModel.swift
//  demoProject
//
//  Created by Sepehr Afla on 2021-12-10.
//

import Foundation
import RxSwift

class CartViewModel {
//
    let shoppingCart = ShoppingCart()
    var totalCost: Float {
        return shoppingCart.cars.value.reduce(0) {
        runningTotal, car in
        return runningTotal + car.priceInDollars
      }
    }
    
    var itemCountString: String {
        guard shoppingCart.cars.value.count > 0 else {
        return "Cart is empty"
      }
      
      //Unique the chocolates
        let setOfCars = Set<Car>(shoppingCart.cars.value)
      
      //Check how many of each exists
      let itemStrings: [String] = setOfCars.map { car in
          let count: Int = shoppingCart.cars.value.reduce(0) {
          runningTotal, reduceChocolate in
          if car == reduceChocolate {
            return runningTotal + 1
          }
          
          return runningTotal
        }
        
          return "\(car.countryName) : \(count)"
      }
      
      return itemStrings.joined(separator: "\n")
    }
    weak var coordinator: FinishCoordinator?
    func go() {
        coordinator?.navigateToFinishScreen()
    }
}
protocol FinishCoordinator: AnyObject {
    func navigateToFinishScreen()
}
