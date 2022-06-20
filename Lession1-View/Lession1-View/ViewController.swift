//
//  ViewController.swift
//  Lession1-View
//
//  Created by Tran Thanh Nhien on 15/06/2022.
//

import UIKit

class ViewController: UIViewController {

    var userImage: UIImageView = UIImageView()
    var userName: UILabel = UILabel()
    var button: UIButton = UIButton()
    var buttonNext: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUserImage()
        self.setupUserName()
        self.setupbutton()
        self.setupbuttonNext()
        
        // Do any additional setup after loading the view.
    }

    func setupUserImage() {
        self.view.addSubview(userImage)
        //let userImage = UIImageView(image: UIImage(named: "customer"))
        userImage.image = UIImage(named: "customer")
        userImage.contentMode = .scaleAspectFill
        //Cach 1
//        let frame = CGRect(x: 50, y: 50, width: 70, height: 70)
//        userImage.frame = frame
        
        //Cach 2
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        userImage.heightAnchor.constraint(equalTo: userImage.widthAnchor, multiplier: 1).isActive = true
        
    }
    func setupUserName() {
        self.view.addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        userName.topAnchor.constraint(equalTo: userImage.bottomAnchor).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        userName.text = "oanhnt42"
//        userName.backgroundColor = .gray
        userName.textAlignment = .center
        userName.textColor = .purple
    }
    
    func setupbutton() {
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        button.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .yellow
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        //let timer = Timer(timeInterval: 0.3, target: self, selector: #selector(nextbutton), userInfo: nil, repeats: false)
    }
    
    func setupbuttonNext() {
        self.view.addSubview(buttonNext)
        buttonNext.translatesAutoresizingMaskIntoConstraints = false

        buttonNext.widthAnchor.constraint(equalTo: button.widthAnchor, multiplier: 1).isActive = true
        buttonNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        buttonNext.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        buttonNext.heightAnchor.constraint(equalTo: button.heightAnchor, multiplier: 1).isActive = true
        
        buttonNext.setTitle("Next", for: .normal)
        buttonNext.setTitleColor(.red, for: .normal)
        buttonNext.backgroundColor = .blue
        buttonNext.addTarget(self, action: #selector(nextbutton), for: .touchUpInside)
    }
    
    @objc func tapButton() {
        userName.text = "Nguyen Thi Oanh team Mobile"
        print("tap tap")
        
    }

    @objc func nextbutton() {
        
        let viewcontroller = SecondViewController()
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}

