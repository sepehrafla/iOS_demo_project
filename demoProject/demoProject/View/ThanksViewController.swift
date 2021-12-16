//
//  ThanksViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-15.
//

import Foundation
import UIKit
class ThanksViewController : UIViewController{
    lazy var ThanksLabel: UILabel = {
        let label = UILabel()
        label.textColor = .orange
        label.textAlignment = .center
        label.text = "Thanks for you purchase"
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    lazy var mainButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Order More"
        button.style = .done
        button.target = self
        button.action = nil
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupview()
        mainButton.action = #selector(reset)
    }
    func setupview() {
        self.navigationItem.leftBarButtonItem = mainButton
        view.addSubview(ThanksLabel)
        ThanksLabel.snp.makeConstraints{make in
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }
  weak var coordinator: LoginCoordinator?
  @IBAction func reset() {
        coordinator?.navigateToItemScreen()
      let itemViewModel = ItemViewModel()
      let itemViewController = ItemViewController(itemViewModel: itemViewModel)
      navigationController?.pushViewController(itemViewController, animated: true)
  }
}
