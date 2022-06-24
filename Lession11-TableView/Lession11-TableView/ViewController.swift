//
//  ViewController.swift
//  Lession11-TableView
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var persons: [[UserModel]] = [[UserModel(userName: "Oanh", userImage: "animegirl"), UserModel(userName: "Sơn", userImage: "animeboy"), UserModel(userName: "Tuấn Anh", userImage: "animeboy3")], [UserModel(userName: "Minh Tú", userImage: "animeboy2"), UserModel(userName: "Long", userImage: "animeboy4"), UserModel(userName: "Tuấn", userImage: "animeboy3")]]
    
    var titles: [String] = ["iOS", "Android"]
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addUser))
        self.navigationItem.rightBarButtonItem = rightBarButton
        self.setUpTableView()
        
    }
    
    @objc func addUser() {
        
        let alert = UIAlertController(title: "Add New Member", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { action in
            print("add success")
        }

        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func setUpTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = persons[indexPath.section][indexPath.row].userName
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected cell: \(persons[indexPath.section][indexPath.row])")
        
        let vc = DetailViewController()
        vc.name = persons[indexPath.section][indexPath.row].userName
        vc.imageName = persons[indexPath.section][indexPath.row].userImage
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
