//
//  Car.swift
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
  
  // An array of cars from europe
  static let ofEurope: [Car] = {
    let buggati = Car(priceInDollars: 2000000,
                            countryName: "Buggati",
                            countryFlagEmoji: UIImage(named: "bugatti")!)
    let tesla = Car(priceInDollars: 100000,
                            countryName: "Tesla",
                            countryFlagEmoji: UIImage(named: "tesla")!)
    let mcLaren = Car(priceInDollars: 800000,
                          countryName: "McLaren",
                          countryFlagEmoji: UIImage(named: "mclaren")!)
    let lamborghini = Car(priceInDollars: 1200000,
                           countryName: "Lamborghini",
                           countryFlagEmoji: UIImage(named: "lambo")!)
    let ferrari = Car(priceInDollars: 400000,
                          countryName: "Ferrari",
                          countryFlagEmoji: UIImage(named: "ferrari")!)
    
    return [buggati,
            tesla,
            mcLaren,
            lamborghini,
            ferrari]
  }()
}
