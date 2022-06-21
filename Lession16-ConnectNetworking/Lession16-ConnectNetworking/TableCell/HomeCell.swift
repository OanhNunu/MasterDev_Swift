//
//  HomeCell.swift
//  Lession16-ConnectNetworking
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

class HomeCell: UITableViewCell {

    //MARK: - Outlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
