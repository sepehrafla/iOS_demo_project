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
    let belgian = Chocolate(priceInDollars: 8,
                            countryName: "Buggati",
                            countryFlagEmoji: UIImage(named: "bugatti")!)
    let british = Chocolate(priceInDollars: 7,
                            countryName: "Tesla",
                            countryFlagEmoji: UIImage(named: "tesla")!)
    let dutch = Chocolate(priceInDollars: 8,
                          countryName: "McLaren",
                          countryFlagEmoji: UIImage(named: "mclaren")!)
    let german = Chocolate(priceInDollars: 7,
                           countryName: "Lamborghini",
                           countryFlagEmoji: UIImage(named: "lambo")!)
    let swiss = Chocolate(priceInDollars: 10,
                          countryName: "Ferrari",
                          countryFlagEmoji: UIImage(named: "ferrari")!)
    
    return [belgian,
            british,
            dutch,
            german,
            swiss]
  }()
}
