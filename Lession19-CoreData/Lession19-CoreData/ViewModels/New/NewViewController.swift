//
//  NewViewController.swift
//  Lession19-CoreData
//
//  Created by Tran Thanh Nhien on 23/06/2022.
//

import UIKit

class NewViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - Actions
    @IBAction func AddUserTouchUpInside(_ sender: Any) {
        
    }
    

}
