//
//  ViewController.swift
//  Lession3-CustomView
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

class ViewController: UIViewController, UserViewDelegate {
    func didTap(view: MyView, count: Int) {
        print("\(count) tap")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = MyView(frame: CGRect(x: 50, y: 100, width: 100, height: 125))
        myView.delegate = self
        self.view.addSubview(myView)
        
        let myDog = MyView(frame: CGRect(x: 200, y: 100, width: 100, height: 125))
        myDog.userAvatar.image = UIImage(named: "dog")
        myDog.userName.text = "Dog"
        self.view.addSubview(myDog)
        
        let myCat = MyView(frame: CGRect(x: 50, y: 275, width: 100, height: 125))
        myCat.userAvatar.image = UIImage(named: "cat")
        myCat.userName.text = "Cat"
        self.view.addSubview(myCat)
    }


}

