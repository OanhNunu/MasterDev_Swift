//
//  Music.swift
//  Lession16-ConnectNetworking
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import Foundation
import UIKit

final class Music {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var artworkUrl100: String
    var thumbnailImage: UIImage?
    
    init(json: JSON) {
        self.id = json["id"] as! String
        self.artistName = json["artistName"] as! String
        self.releaseDate = json["releaseDate"] as! String
        self.name = json["name"] as! String
        self.artworkUrl100 = json["artworkUrl100"] as! String
    }
}

enum APIError: Error {
    case error(String)
    case errorURL
    
    var localizedDescription: String {
        switch self {
        case .error(let string):
            return string
        case .errorURL:
            return "URL String is error."
        }
    }
}
