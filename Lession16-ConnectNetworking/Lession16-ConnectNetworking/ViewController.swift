//
//  ViewController.swift
//  Lession16-ConnectNetworking
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var viewmodel = HomeViewModel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
        updateUI()
    }
    
    func setupUI() {
        //title
        self.title = "Home"
        
        //tableview
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "HomeCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        //navigation
        let resetTabbarItem = UIBarButtonItem(image: UIImage(named: "ic-navi-refresh"), style: .plain, target: self, action: #selector(loadAPI))
        self.navigationItem.rightBarButtonItem = resetTabbarItem
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setupData() {
        self.loadAPI()
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    //MARK: - API
    @objc func loadAPI() {
        print("LOAD API")
        viewmodel.loadAPI { (done, msg) in
            if done {
                self.updateUI()
            } else {
                print("API ERROR: \(msg)")
            }
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeCell
        cell.titleLabel.text = viewmodel.names[indexPath.row]
        
/*        let item = viewmodel.musics[indexPath.row]
        cell.titleLabel.text = item.name
        cell.artistNameLabel.text = item.artistName
        if item.thumbnailImage != nil {
            cell.thumbnail.image = item.thumbnailImage
        } else {
            cell.thumbnail.image = nil
            
            //downloader
            Networking.shared().downloadImage(url: item.artworkUrl100) { (image) in
                if let image = image {
                    cell.thumbnail.image = image
                    item.thumbnailImage = image
                } else {
                    cell.thumbnail.image = nil
                }
            }
        }
*/
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.names.count
        //return viewmodel.musics.count
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
