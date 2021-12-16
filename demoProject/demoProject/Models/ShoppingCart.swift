//
//  ShoppingCart.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-03.
//

import Foundation
import RxSwift
import RxCocoa

class ShoppingCart {
  static let sharedCart = ShoppingCart()
  let cars: BehaviorRelay<[Car]> = BehaviorRelay(value: [])
}

//MARK: Non-Mutating Functions
extension ShoppingCart {
  var totalCost: Float {
    return cars.value.reduce(0) {
      runningTotal, car in
      return runningTotal + car.priceInDollars
    }
  }
  
  var itemCountString: String {
    guard cars.value.count > 0 else {
      return "Cart is empty"
    }
    
    //Unique the cars
    let setOfCars = Set<Car>(cars.value)
    
    //Check how many of each exists
    let itemStrings: [String] = setOfCars.map { car in
      let count: Int = cars.value.reduce(0) {
        runningTotal, reduceCars in
        if car == reduceCars {
          return runningTotal + 1
        }
        
        return runningTotal
      }
      
        return "\(car.countryName) : \(count)"
    }
    
    return itemStrings.joined(separator: "\n")
  }
}
