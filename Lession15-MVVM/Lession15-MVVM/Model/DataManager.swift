//
//  DataManager.swift
//  Lession15-MVVM
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class DataManager {
    
    //singleton
    private static var sharedDataManager: DataManager = {
        let dataManager = DataManager()
        return dataManager
    }()
    
    class func shared() -> DataManager {
        return sharedDataManager
    }
    
    // init
    private init() {}
    
    //open database
    func read() -> (String, String) {
        let email = UserDefaults.standard.string(forKey: "email") ?? ""
        let password = UserDefaults.standard.string(forKey: "password") ?? ""
        return (email, password)
    }
    
    //save database
    func save(email: String, password: String) {
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(password, forKey: "password")
        UserDefaults.standard.synchronize()
    }
}
