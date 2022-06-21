//
//  LoginViewController.swift
//  Lession15-MVVM
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Variables
    var viewModel = LoginViewModel(email: "oanhnt42@ghtk.co", password: "123456")
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    override func setupUI() {
//        super.setupUI()
//        self.title = "Login"
//        updateView()
//    }
//    
//    override func setupData() {
//    }
//    
    func updateView() {
        passwordTextField.isSecureTextEntry = true
        emailTextField.text = viewModel.email
        passwordTextField.text = viewModel.password
    }
    
    //MARK: - Actions
    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let email = emailTextField.text ?? "oanhnt42@ghtk.co"
        let password = passwordTextField.text ?? "123456"
        
        let complete: LoginViewModel.Completion = { (result) in
            switch result {
            case .success:
                
                    let alert = UIAlertController(title: "Login Successfully!", message: "", preferredStyle: .alert)
                    let okaction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(okaction)
                    self.present(alert, animated: true)
                    
                    print("Đăng nhập thành công")
                    self.updateView()
                
            case .failure(let isError, let errorMsg):
                if isError {
                    let alert = UIAlertController(title: "Login failed!", message: "", preferredStyle: .alert)
                    let okaction = UIAlertAction(title: "Thử lại", style: .destructive, handler: nil)
                    alert.addAction(okaction)
                    self.present(alert, animated: true)
                    
                    print("Đăng nhập thất bại")
                    print(errorMsg)
                    self.updateView() ///set lại textfield rỗng để nhập thông tin
                }
            }
        }
        viewModel.login(email: email, password: password, completion: complete)

    }
    
}
