//
//  Chocolate.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation
import UIKit
struct Car: Equatable, Hashable {
  let priceInDollars: Float
  let countryName: String
  let countryFlagEmoji: UIImage
  
  // An array of chocolate from europe
  static let ofEurope: [Car] = {
    let belgian = Car(priceInDollars: 2000000,
                            countryName: "Buggati",
                            countryFlagEmoji: UIImage(named: "bugatti")!)
    let british = Car(priceInDollars: 100000,
                            countryName: "Tesla",
                            countryFlagEmoji: UIImage(named: "tesla")!)
    let dutch = Car(priceInDollars: 800000,
                          countryName: "McLaren",
                          countryFlagEmoji: UIImage(named: "mclaren")!)
    let german = Car(priceInDollars: 1200000,
                           countryName: "Lamborghini",
                           countryFlagEmoji: UIImage(named: "lambo")!)
    let swiss = Car(priceInDollars: 400000,
                          countryName: "Ferrari",
                          countryFlagEmoji: UIImage(named: "ferrari")!)
    
    return [belgian,
            british,
            dutch,
            german,
            swiss]
  }()
}
