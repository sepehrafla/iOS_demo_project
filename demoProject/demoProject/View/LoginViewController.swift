//
//  ViewController.swift
//  demoProject
//
//  Created by Sepehr Aflatounian on 2021-12-02.
//

import UIKit
import SnapKit
import RxSwift

class LoginViewController: UIViewController {
    
    private let loginViewModel: LoginViewModel
    let disposeBag = DisposeBag()
    
    init (loginViewModel: LoginViewModel){
        self.loginViewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Login Page"
        label.font = .boldSystemFont(ofSize: 50)
        label.textAlignment = .center
        return label
    }()
    lazy var userNameField : UITextField = {
        let text = UITextField()
        text.placeholder = "Username"
        text.borderStyle = .none
        return text
    }()
    lazy var userPasswordField : UITextField = {
        let text = UITextField()
        text.placeholder = "Password"
        text.borderStyle = .none
        return text
    }()
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
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
        } else {
            let alert = UIAlertController(title: "Error", message: "Username or Password is invalid", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Try again!", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func createViewModelBinding(){
            
        userNameField.rx.text.orEmpty
            .bind(to: loginViewModel.emailIdViewModel.data)
            .disposed(by: disposeBag)
        
        userPasswordField.rx.text.orEmpty
            .bind(to: loginViewModel.passwordViewModel.data)
            .disposed(by: disposeBag)
        
        loginButton.rx.tap.do(onNext:  { [unowned self] in
            self.userNameField.resignFirstResponder()
            self.userPasswordField.resignFirstResponder()
        }).subscribe(onNext: { [unowned self] in
            if self.loginViewModel.validateCredentials() {
                self.loginViewModel.loginUser()
            }
        }).disposed(by: disposeBag)

    }
        
    func createCallbacks (){
        
        // success
        loginViewModel.isSuccess.asObservable()
            .bind{ value in
                NSLog("Successfull")
            }.disposed(by: disposeBag)
        
        // errors
        loginViewModel.errorMsg.asObservable()
            .bind { errorMessage in
                // Show error
                NSLog("Failure")
            }.disposed(by: disposeBag)

    }
    
    func setupview() {
        view.addSubview(titleLable)
        view.addSubview(userNameField)
        view.addSubview(userPasswordField)
        view.addSubview(loginButton)
        titleLable.snp.makeConstraints{make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
        }
        userNameField.snp.makeConstraints{make in
            make.top.equalTo(titleLable.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(30)
        }
        userPasswordField.snp.makeConstraints{make in
            make.top.equalTo(userNameField.snp.bottom).offset(20)
            make.left.right.equalTo(userNameField)
            make.height.equalTo(40)
        }
        loginButton.snp.makeConstraints{make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-70)
            make.left.right.equalToSuperview().inset(50)
        }
    }
}

