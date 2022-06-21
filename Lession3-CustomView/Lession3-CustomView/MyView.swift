//
//  MyView.swift
//  Lession3-CustomView
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

protocol UserViewDelegate {
    func didTap(view: MyView, count: Int)
}

class MyView: UIView {
       
    var userAvatar: UIImageView!
    var userName: UILabel!
    var markbutton: UIButton!
    var count = 0
    var delegate: UserViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        // thêm ảnh avatar của user
        userAvatar = UIImageView(image: UIImage(named: "logoGHTK"))
        userAvatar.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.size.width,
                                  height: frame.size.height*4/5)
        userAvatar.contentMode = .scaleToFill
        self.addSubview(userAvatar)
               
       // thêm tên user
        userName = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        userName.text = "Oanhnt42"
        userName.backgroundColor = .lightGray
        userName.textAlignment = .center
        userName.textColor = .blue
        self.addSubview(userName)
               
        // them button của view
        markbutton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        markbutton.backgroundColor = .clear
        markbutton.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(markbutton)
    }
    
    @objc func tap() {
        count += 1
        userName.text = "\(count)"
        if let delegate = delegate {
            delegate.didTap(view: self, count: count)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
