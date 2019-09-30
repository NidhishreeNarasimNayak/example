//
//  CareerVM.swift
//  ymlApp
//
//  Created by Nidhishree on 28/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation
import Foundation
import HCVimeoVideoExtractor
class CareerViewModel: BaseVM {
    
    var jsonItems: [BoardMembers] = []
    
    let jsonURL = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=4aa92de4ac9a4ab6870e37f3700a9b0b"
    let userKey = "5b87065d-b207-44fc-aa26-b9e1253720d6"
    let projectKey = "9a5070e8-cd53-46d4-ae0a-c25f3458c81c"
    let videoURL = "https://vimeo.com/293855154"
    
    typealias jsonHandler = (() -> Void)
    typealias videoHandler = ((URL) -> Void)
    
    func loadPositionsFromJson(_ compHandler: @escaping jsonHandler){
        let headers = ["Content-Type": "application/json", "JsonStub-User-Key" : userKey, "JsonStub-Project-Key": projectKey] //storing
        NetworkManager.shared.get(urlString: jsonURL, headers: nil, successHandler: {
            [weak self] (data) in
            do {
                print(String(data: data, encoding: .utf8))
                let root = try JSONDecoder().decode(Root.self, from: data)
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                //print(root)
                let data = root.data
                self?.jsonItems = data
                for item in data {
                    print(item.domain)
                    print(item.position)
                    print(item.location)
                }
                DispatchQueue.main.async {
                    compHandler()
                }
            } catch {
                print("Error : \(error)")
            }
        })
    }
    
    func playVideo(_ completionHandler: @escaping videoHandler){
        guard let url = URL(string: self.videoURL) else{
            print("Invalid url")
            return
        }
        HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
            if let err = error {
                print("Error = \(err.localizedDescription)")
                return
            }
            guard let vid = video else {
                print("Invalid video object")
                return
            }
            print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
            if let videoURL = vid.videoURL[.Quality540p] {
                completionHandler(videoURL)
            }
        })
    }
}
