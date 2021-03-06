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
    private let cartViewModel: CartViewModel
    init (cartViewModel: CartViewModel){
        self.cartViewModel = cartViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var totalNamesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    lazy var totalItemsLabel: UILabel = {
        let label = UILabel()
        label.text = "Cars"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    lazy var totalCostLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        return label
    }()
    lazy var cartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Buy"
        button.style = .done
        button.target = self
        button.action = nil
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Cart"
        // Do any additional setup after loading the view.
        setupview()
        configureFromCart()
        cartButton.action = #selector(cartButtonPressed)
       
    }
    @objc func cartButtonPressed(){
        reset()
        cartViewModel.go()
    }
    func setupview() {
        self.navigationItem.rightBarButtonItem = cartButton
        view.addSubview(totalNamesLabel)
        totalNamesLabel.numberOfLines = 0
        totalNamesLabel.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(5)

        }
        
        view.addSubview(totalItemsLabel)
        totalItemsLabel.numberOfLines = 0
        totalItemsLabel.snp.makeConstraints{make in
            make.top.equalTo(totalNamesLabel)
            make.leading.equalTo(totalNamesLabel.snp.trailing).offset(5)
        }
        view.addSubview(totalCostLabel)
        totalCostLabel.numberOfLines = 0
        totalCostLabel.snp.makeConstraints{make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(10)
        }
    }
}
extension ShoppingCartViewController {
  @IBAction func reset() {
    ShoppingCart.sharedCart.cars.accept([])
    let finishViewController = ThanksViewController()
    let _ = navigationController?.pushViewController(finishViewController, animated: true)
  }
}
private extension ShoppingCartViewController {
  func configureFromCart() {
    
    let cart = ShoppingCart.sharedCart
    totalItemsLabel.text = cart.itemCountString
    let cost = cart.totalCost
    totalCostLabel.text = CurrencyFormatter.dollarsFormatter.string(from: cost)
  }
}


