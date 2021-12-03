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
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Chocolate"
        label.backgroundColor = .brown
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    private var cartButton : UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.tintColor = .blue
        return button
    }()
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        chocolates = Chocolate.ofEurope
        print(chocolates)
        setupview()
    }
    
    func setupview() {
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 70
        tableView.register(ChocolateCell.self, forCellReuseIdentifier: "ChocolateCell")
        tableView.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(5)
        }
    }
}


extension ItemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chocolates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChocolateCell") as! ChocolateCell
        let chocolate = chocolates[indexPath.row]
        cell.set(chocolate: chocolate)
        return cell
    }
}
