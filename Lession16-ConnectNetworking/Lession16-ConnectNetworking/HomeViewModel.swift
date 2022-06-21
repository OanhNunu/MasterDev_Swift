//
//  HomeViewModel.swift
//  Lession16-ConnectNetworking
//
//  Created by Tran Thanh Nhien on 21/06/2022.
//

import UIKit

typealias Completion = (Bool, String) -> Void

class HomeViewModel {
    var names: [String] = []
    var musics: [Music] = []
    
    func loadAPI(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        let url = URL(string: urlString)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        //config
        let config = URLSessionConfiguration.ephemeral
        config.waitsForConnectivity = true
        
        //session
        let session = URLSession(configuration: config)
//        let task = session.dataTask(with: request) { (data, response, error) in
//            DispatchQueue.main.async {
//                if let error = error {
//                    print("API - THẤT BẠI")
//                } else {
//                    print("API - THÀNH CÔNG")
//                }
//            }
//        }
        //connect
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    //call back
                    completion(false, error.localizedDescription)
                } else {
                    if let data = data {
                        let json = data.toJSON()
                        if let feed = json["feed"] as? JSON, let results = feed["results"] as? [JSON] {
                            
                            
                            for item in results {
                                let name = item["name"] as! String
                                self.names.append(name)
                            }
                            
                            //call back
                            completion(true, "")
                        } else {
                            completion(false, "can not parser json")
                        }
                        
                    } else {
                       //call back
                       completion(false, "Data format is error.")
                    }
                }
            }
        }
        //thực thi connect sử dụng hàm resume
        task.resume()
        print("Done")
    }
    
/*    func loadAPI2(completion: @escaping Completion) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/100/explicit.json"
        
        Networking.shared().request(with: urlString) { (data, error) in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                if let data = data {
                    let json = data.toJSON()
                    let feed = json["feed"] as! JSON
                    let results = feed["results"] as! [JSON]
                    
                    for item in results {
                        let music = Music(json: item)
                        self.musics.append(music)
                        
                        completion(true, "")
                    }
                } else {
                    completion(false, "Data format is error.")
                }
            }
        }
    }
*/
}
