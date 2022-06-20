//
//  ViewController.swift
//  Lession2-TouchEvent
//
//  Created by Tran Thanh Nhien on 16/06/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ball: UIImageView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //Lay toa do diem cham
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let currentPoint = touch.location(in: view)
            print("Tap tại điểm: \(currentPoint.x), \(currentPoint.y)")
            
            let currentPointRed = touch.location(in: redView)
            print("Tap view Red tại: \(currentPointRed.x), \(currentPointRed.y)")
            
            if touch.view == redView {
                print("Inside Red View")
            } else if touch.view == greenView {
                print("Inside Green View")
            } else {
                print("Outside")
            }
        }
    }
    
    //Di chuyen 1 doi tuong View
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == ball {
                let location = touch.location(in: view)
                ball.center = location
            }
        }
    }
    @IBAction func btnNext(_ sender: Any) {
        let vc = LineViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

