//
//  UserModel.swift
//  Lession19-CoreData
//
//  Created by Tran Thanh Nhien on 24/06/2022.
//

import Foundation


enum Gender: Int {
    case male = 1
    case female = 2
    case LGPT = 3
    
    
    var title: String {
        switch self {
        case .male:
            return "male"
        case .female:
            return "female"
        case .LGPT:
            return "LGPT"
        }
    }
}
