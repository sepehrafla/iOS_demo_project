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
        label.font = .boldSystemFont(ofSize: 70)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupview()
    }
    func setupview() {
        view.addSubview(ThanksLabel)
        ThanksLabel.snp.makeConstraints{make in
            make.centerX.equalToSuperview()
        }
    }
}
