//
//  NetworkManager.swift
//  ymlApp
//
//  Created by Nidhishree on 28/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import Foundation

protocol HTTPMethods{
    func get(urlString: String, headers: [String: String]?, successHandler: @escaping (Data) -> Void)
    func post(urlString: String, headers: [String: String]?, succesHandler: @escaping () -> Void)
}
class NetworkManager: BaseVM, HTTPMethods{
    static let shared = NetworkManager()
    private override init(){
    }
    func check(){
        print("In GET")
    }
    
    func get(urlString: String, headers: [String : String]? = nil, successHandler: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return}
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        if let headers = headers{
            for (key,value) in headers{
                urlRequest.addValue(value, forHTTPHeaderField: key)
            }
        }
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            if let response = response as? HTTPURLResponse{
                print("response\(response)")
                if response.statusCode >= 200 && response.statusCode < 300 {
                    if let data = data {
                        successHandler(data)
                    }
                    else {
                        print("Invalid Data")
                        return
                    }
                }
                else{
                    print("Invalid response")
                    return
                }
            }
        }).resume()
    }
    func post(urlString: String, headers: [String : String]? = nil, succesHandler: () -> Void) {
    }
}




