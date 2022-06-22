//
//  HomeCell.swift
//  Lession12-CustomCell
//
//  Created by Tran Thanh Nhien on 17/06/2022.
//

import UIKit

class HomeCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var nameUserLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Actions
    @IBAction func FollowButton(_ sender: Any) {
    }
    
}
