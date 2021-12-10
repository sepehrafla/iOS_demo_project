//
//  ShoppingCartViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-07.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ShoppingCartViewController : UIViewController{
    lazy var totalItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Cars"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Cart"
        // Do any additional setup after loading the view.
        setupview()
        configureFromCart()
       
    }
    func setupview() {
        view.addSubview(totalItemsLabel)
        totalItemsLabel.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }
    }
}
extension ShoppingCartViewController {
  @IBAction func reset() {
    ShoppingCart.sharedCart.chocolates.accept([])
    let _ = navigationController?.popViewController(animated: true)
  }
}
private extension ShoppingCartViewController {
  func configureFromCart() {
    
    let cart = ShoppingCart.sharedCart
    totalItemsLabel.text = cart.itemCountString
    
    let cost = cart.totalCost
//    totalCostLabel.text = CurrencyFormatter.dollarsFormatter.string(from: cost)
  }
}


