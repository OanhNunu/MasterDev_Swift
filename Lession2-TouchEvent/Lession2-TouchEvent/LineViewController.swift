//
//  LineViewController.swift
//  Lession2-TouchEvent
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

class LineViewController: UIViewController {

    //Ve 1 duong thang tren view
    var path = UIBezierPath()
    var firstLocation = CGPoint.zero
    var shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }

    func setupView() {
        view.layer.addSublayer(shapeLayer)
        self.shapeLayer.lineWidth = 2
        self.shapeLayer.strokeColor = UIColor.blue.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view){
            firstLocation = location
            print(location)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let location = touches.first?.location(in: view) {
            
            path.removeAllPoints()
            path.move(to: firstLocation)
            path.addLine(to: location)
            shapeLayer.path = path.cgPath
        }
    }


}
