//
//  ViewController.swift
//  Lession13-CollectionView
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class ViewController: UIViewController {

    var users: [User] = User.getDummyDatas()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        
        //1
        //let screenWidth = UIScreen.main.bounds.width - 10
        let screenWidth = UIScreen.main.bounds.width
        //2
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        //layout.itemSize = CGSize(width: screenWidth/3, height: (screenWidth/3)*5/4)
        layout.itemSize = CGSize(width: (screenWidth/3)-5, height: (screenWidth/3)-35)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        //3
        collectionView!.collectionViewLayout = layout
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeViewCell
        let item = users[indexPath.row]
        cell.nameLabel.text = item.name
        cell.avatarImage.image = UIImage(named: item.avatar)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
