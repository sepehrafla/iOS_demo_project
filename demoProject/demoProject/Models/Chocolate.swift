//
//  Chocolate.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation
import UIKit
struct Chocolate: Equatable, Hashable {
  let priceInDollars: Float
  let countryName: String
  let countryFlagEmoji: UIImage
  
  // An array of chocolate from europe
  static let ofEurope: [Chocolate] = {
    let belgian = Chocolate(priceInDollars: 2000000,
                            countryName: "Buggati",
                            countryFlagEmoji: UIImage(named: "bugatti")!)
    let british = Chocolate(priceInDollars: 100000,
                            countryName: "Tesla",
                            countryFlagEmoji: UIImage(named: "tesla")!)
    let dutch = Chocolate(priceInDollars: 800000,
                          countryName: "McLaren",
                          countryFlagEmoji: UIImage(named: "mclaren")!)
    let german = Chocolate(priceInDollars: 1200000,
                           countryName: "Lamborghini",
                           countryFlagEmoji: UIImage(named: "lambo")!)
    let swiss = Chocolate(priceInDollars: 400000,
                          countryName: "Ferrari",
                          countryFlagEmoji: UIImage(named: "ferrari")!)
    
    return [belgian,
            british,
            dutch,
            german,
            swiss]
  }()
}
