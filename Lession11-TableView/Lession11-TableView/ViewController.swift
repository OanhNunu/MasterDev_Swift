//
//  ViewController.swift
//  Lession11-TableView
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {

    //var names: [String] = ["Oanh", "Tuan Anh", "Tung", "Dac Son", "Binh", "Trung", "Thai Son"]
    var names: [[String]] = [["Oanh", "Tuan Anh", "Tung", "Dac Son", "Binh", "Trung", "Thai Son"],
                             ["Giap", "Long", "Minh Tu", "Phong", "Thanh", "Tuan", "Huy", "Quang", "Vân", "Đài", "Tiến"]]
    
    var persons: [[UserModel]] = [[UserModel(userName: "Oanh", userImage: "animegirl"), UserModel(userName: "Sơn", userImage: "animeboy"), UserModel(userName: "Tuấn Anh", userImage: "animeboy3")], [UserModel(userName: "Minh Tú", userImage: "animeboy2"), UserModel(userName: "Long", userImage: "animeboy4"), UserModel(userName: "Tuấn", userImage: "animeboy3")]]
    
    var titles: [String] = ["iOS", "Android"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        //return 1
        //return names.count
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return names[section].count
        return persons[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = names[indexPath.row]
        //cell.textLabel?.text = names[indexPath.section][indexPath.row]
        cell.textLabel?.text = persons[indexPath.section][indexPath.row].userName
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("selected cell: \(names[indexPath.row])")
//        print("selected cell: \(names[indexPath.section][indexPath.row])")
        print("selected cell: \(persons[indexPath.section][indexPath.row])")
        
        let vc = DetailViewController()
        //vc.name = names[indexPath.section][indexPath.row]
        vc.name = persons[indexPath.section][indexPath.row].userName
        vc.imageName = persons[indexPath.section][indexPath.row].userImage
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
