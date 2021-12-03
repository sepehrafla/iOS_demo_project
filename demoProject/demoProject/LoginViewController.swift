//
//  ViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    private let loginViewModel: LoginViewModel
    
    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Login Page"
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var userNameField : UITextField = {
        let text = UITextField()
        text.placeholder = "Username"
        text.borderStyle = .none
        return text
    }()
    
    private lazy var userPasswordField : UITextField = {
        let text = UITextField()
        text.placeholder = "Password"
        text.borderStyle = .none
        return text
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    init (loginViewModel: LoginViewModel){
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupview()
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
       
    }
    @objc func loginButtonPressed(){
        if userNameField.text == "Admin" && userPasswordField.text == "123"{
            loginViewModel.login()
        }
    }
    
    func setupview() {
        view.addSubview(titleLable)
        titleLable.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }
        view.addSubview(userNameField)
        userNameField.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(30)
        }
        view.addSubview(userPasswordField)
        userPasswordField.snp.makeConstraints{make in
            make.top.equalTo(userNameField.snp.bottom).offset(20)
            make.left.right.equalTo(userNameField)
            make.height.equalTo(40)
        }
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints{make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-70)
            make.left.right.equalToSuperview().inset(50)
        }
    }
}

