//
//  ItemViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class ItemViewController : UIViewController{
    
    var chocolates: [Chocolate] = []
    let cars = Observable.just(Chocolate.ofEurope)
    let disposeBag = DisposeBag()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Cars"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    lazy var cartButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    lazy private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chocolates = Chocolate.ofEurope
        setupview()
        setupCartObserver()
        setupCellConfiguration()
        setupCellTapHandling()
    }
    
    func setupview() {
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableView)
//        tableView.delegate = self
//        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.register(ChocolateCell.self, forCellReuseIdentifier: "ChocolateCell")
        tableView.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(5)
        }
        view.addSubview(cartButton)
        cartButton.snp.makeConstraints{make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.left.right.equalToSuperview().inset(50)
        }
    }
}

private extension ItemViewController {
  func setupCartObserver() {
    ShoppingCart.sharedCart.chocolates.asObservable()
      .subscribe(onNext: { [unowned self] chocolates in
          self.cartButton.setTitle("\(chocolates.count) \u{1F3CE}", for: .normal)
          print(chocolates.count)
          self.cartButton.setTitleColor(.white, for: .normal)
      })
      .disposed(by: disposeBag)
  }
  
  func setupCellConfiguration() {
    cars
      .bind(to: tableView
        .rx
        .items(cellIdentifier: ChocolateCell.Identifier,
               cellType: ChocolateCell.self)) { row, chocolate, cell in
                cell.set(chocolate: chocolate)
      }
      .disposed(by: disposeBag)
  }
  
  func setupCellTapHandling() {
    tableView
      .rx
      .modelSelected(Chocolate.self)
      .subscribe(onNext: { [unowned self] chocolate in
        let newValue =  ShoppingCart.sharedCart.chocolates.value + [chocolate]
        ShoppingCart.sharedCart.chocolates.accept(newValue)
        
        if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
          self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
      })
      .disposed(by: disposeBag)
  }
}


//extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chocolates.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ChocolateCell") as! ChocolateCell
//        let chocolate = chocolates[indexPath.row]
//        cell.set(chocolate: chocolate)
//        return cell
//    }
//}

extension ItemViewController: SegueHandler {
  enum SegueIdentifier: String {
    case goToCart
  }
}
