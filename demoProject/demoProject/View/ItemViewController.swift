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
import Pods_demoProject

class ItemViewController : UIViewController{
    
    private let itemViewModel: ItemViewModel
    init (itemViewModel: ItemViewModel){
        self.itemViewModel = itemViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var setOfCars: [Car] = []
    let cars = Observable.just(Car.ofEurope)
    let disposeBag = DisposeBag()
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Cars"
        label.textColor = .red
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    lazy var cartButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "\u{1F6D2}"
        button.style = .done
        button.target = self
        button.action = nil
        return button
    }()
    lazy var logout: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Logout"
        button.style = .done
        button.target = self
        button.action = nil
        return button
    }()

    lazy private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setOfCars = Car.ofEurope
        setupview()
        setupCartObserver()
        setupCellConfiguration()
        setupCellTapHandling()
//        cartButton.addTarget(self, action: #selector(cartButtonPressed), for: .touchUpInside)
        cartButton.action = #selector(cartButtonPressed)
        logout.action =  #selector(gobacktoroot)
    }
    @objc func cartButtonPressed(){
        itemViewModel.login()
    }
    @objc func gobacktoroot () {
        ShoppingCart.sharedCart.cars.accept([])
        self.navigationController?.popToRootViewController(animated: true)
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
        tableView.register(CarCell.self, forCellReuseIdentifier: "CarCell")
        tableView.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(5)
        }
        self.navigationItem.rightBarButtonItem = cartButton
        self.navigationItem.leftBarButtonItem = logout
    }
}

private extension ItemViewController {
  func setupCartObserver() {
    ShoppingCart.sharedCart.cars.asObservable()
      .subscribe(onNext: { [unowned self] setOfCars in
          self.cartButton.title = "\u{1F6D2} (\(setOfCars.count))"
          print(setOfCars.count)
      })
      .disposed(by: disposeBag)
  }
  
  func setupCellConfiguration() {
    cars
      .bind(to: tableView
        .rx
        .items(cellIdentifier: CarCell.Identifier,
               cellType: CarCell.self)) { row, car, cell in
                cell.set(car: car)
      }
      .disposed(by: disposeBag)
  }
  
  func setupCellTapHandling() {
    tableView
      .rx
      .modelSelected(Car.self)
      .subscribe(onNext: { [unowned self] car in
        let newValue =  ShoppingCart.sharedCart.cars.value + [car]
        ShoppingCart.sharedCart.cars.accept(newValue)
        
        if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
          self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
        }
      })
      .disposed(by: disposeBag)
  }
}
extension ItemViewController {
  @IBAction func reset() {
    ShoppingCart.sharedCart.cars.accept([])
    let _ = navigationController?.popViewController(animated: true)
  }
}


