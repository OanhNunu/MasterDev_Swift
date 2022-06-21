//
//  Data.Ext.swift
//  Lession16-ConnectNetworking
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit
import Foundation

typealias JSON = [String: Any]

extension Data {
    func toJSON() -> JSON {
        var json: [String: Any] = [:]
        do {
            if let jsonObj = try JSONSerialization.jsonObject(with: self, options: []) as? JSON {
                json = jsonObj
            }
        } catch {
            print("JSON casting error")
        }
        return json
    }
}
