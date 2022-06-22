//
//  ViewController.swift
//  Lession12-CustomCell
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var myTable: UITableView!
    
    var titleSection: [String] = ["iOS", "Android"]
    //var names: [[String]] = [["Oanh", "Tuấn Anh", "Sơn"], ["Minh Tú", "Long", "Tuấn"]]
    var person: [[User]] = [[User(name: "Oanh", subtitle: "Mobile iOS", img: "animegirl"), User(name: "Tuấn Anh", subtitle: "Mobile iOS", img: "animeboy"), User(name: "Sơn", subtitle: "Mobile iOS", img: "animeboy2")], [User(name: "Long", subtitle: "Mobile Android", img: "animeboy3"), User(name: "Minh Tú", subtitle: "Mobile Android", img: "animeboy4"), User(name: "Tuấn", subtitle: "Mobile Android", img: "3"), User(name: "Giáp", subtitle: "Mobile Android", img: "2")]]
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
    }
    
    func setUpTable() {
        myTable.register(UINib(nibName: "HomeCell", bundle: .main), forCellReuseIdentifier: "cell")
        myTable.dataSource = self
        myTable.delegate = self

    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleSection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleSection[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.nameUserLabel.text = person[indexPath.section][indexPath.row].name
        cell.subtitleLabel.text = person[indexPath.section][indexPath.row].subtitle
        cell.imgUser.image = UIImage(named: person[indexPath.section][indexPath.row].img ?? "animeboy")
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
