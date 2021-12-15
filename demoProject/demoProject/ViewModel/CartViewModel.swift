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
        return shoppingCart.chocolates.value.reduce(0) {
        runningTotal, chocolate in
        return runningTotal + chocolate.priceInDollars
      }
    }
    
    var itemCountString: String {
        guard shoppingCart.chocolates.value.count > 0 else {
        return "Cart is empty"
      }
      
      //Unique the chocolates
        let setOfChocolates = Set<Chocolate>(shoppingCart.chocolates.value)
      
      //Check how many of each exists
      let itemStrings: [String] = setOfChocolates.map { chocolate in
          let count: Int = shoppingCart.chocolates.value.reduce(0) {
          runningTotal, reduceChocolate in
          if chocolate == reduceChocolate {
            return runningTotal + 1
          }
          
          return runningTotal
        }
        
          return "\(chocolate.countryName) : \(count)"
      }
      
      return itemStrings.joined(separator: "\n")
    }
}
