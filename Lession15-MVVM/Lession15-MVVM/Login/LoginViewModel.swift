//
//  LoginViewModel.swift
//  Lession15-MVVM
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

enum LoginResult {
    case success
    case failure(Bool, String)
}

final class LoginViewModel {
    
    // MARK: - Variables
    var email: String = ""
    var password: String = ""
    
    typealias Completion = (LoginResult) -> Void
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    // MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            //callback
            completion(.failure(true, "Mật khẩu hoặc email rỗng."))
            //completion(false)
        } else if email != "oanhnt42@ghtk.co" || password != "123456" {
            //callback
            completion(.failure(true, "Sai thông tin đăng nhập"))
            //completion(false)
        } else {
            //cập nhật dữ liệu
            self.email = ""
            self.password = ""
            
            //save data
            DataManager.shared().save(email: email, password: password)
            
            //callback
            completion(.success)
            //completion(true)
        }
    }
    
}
