//
//  HomeViewController.swift
//  Lession19-CoreData
//
//  Created by Tran Thanh Nhien on 23/06/2022.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    var fetchedResultsController: NSFetchedResultsController<User>!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeCell", bundle: .main), forCellReuseIdentifier: "cell")
        
        let leftBarItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editVC))
        self.navigationItem.leftBarButtonItem = leftBarItem
        
        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addVC))
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        save(name: "Tí", age: 10, gender: true)
        save(name: "Tèo", age: 12, gender: true)
        save(name: "Linh", age: 9, gender: false)
        save(name: "Trang", age: 8, gender: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.initializeFetchedResultsController()
    }
    
    @objc func editVC() {
        let vc = EditViewController()
        self.navigationController?.present(vc, animated: true)
    }
    
    @objc func addVC() {
        let vc = NewViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //init fetch result
    func initializeFetchedResultsController() {
            
        // Create Fetch Request
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        //Predicate: lọc điều kiện có giới tính male
        fetchRequest.predicate = NSPredicate(format: "gender == true")
        
        // Configure Fetch Request
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        // lấy AppDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // lấy Managed Object Context
        let managedContext = appDelegate.persistentContainer.viewContext
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,  managedObjectContext: managedContext, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
        } catch {
            fatalError("Failed to initialize FetchedResultsController:\(error)")
        }

        
    }
    
    //MARK: - Dummy Data
    func save(name: String, age: Int, gender: Bool) {
        
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
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }

}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        let user = fetchedResultsController.object(at: indexPath)
        cell.nameLabel.text = user.name
        cell.genderLabel.text = user.gender ? "Male": "Female"
        cell.ageLabel.text = "\(user.age) years old"
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension HomeViewController: NSFetchedResultsControllerDelegate {
    
}
