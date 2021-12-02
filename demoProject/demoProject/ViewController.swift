//
//  ViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Login Page"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Username: "
        return label
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Password: "
        return label
    }()
    
    
    lazy var userNametext : UITextView = {
        let text = UITextView()
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupview()
    }
    
    func setupview() {
        view.addSubview(titleLable)
        view.addSubview(userNameLabel)
        view.addSubview(passwordLabel)
        view.addSubview(userNametext)
        
        titleLable.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        userNameLabel.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(10)

        }
        passwordLabel.snp.makeConstraints{make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(10)

        }
        userNametext.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
            make.trailing.equalToSuperview().inset(10)

        }
        
    }
}

