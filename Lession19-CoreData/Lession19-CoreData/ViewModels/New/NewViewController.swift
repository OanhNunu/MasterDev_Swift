//
//  NewViewController.swift
//  Lession19-CoreData
//
//  Created by Tran Thanh Nhien on 23/06/2022.
//

import UIKit
import CoreData

class NewViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func save(name: String, age: Int, gender: Int) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(name, forKeyPath: "name")
        user.setValue(age, forKeyPath: "age")
        user.setValue(gender, forKeyPath: "gender")
        
        do {
            //lưu lại
            try managedContext.save()
            // clear text
            
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    //MARK: - Actions
    @IBAction func AddUserTouchUpInside(_ sender: Any) {
        guard let name = self.nameTextField.text, !name.isEmpty,
              let age = Int(self.ageTextField.text ?? "0"), age > 0,
              let gender = Int(self.genderTextField.text ?? "5"), gender <= 3
        else {
            return
        }
        
        self.save(name: name, age: age, gender: gender)
        
    }
    

}
