//
//  ViewController.swift
//  wordDictionary
//
//  Created by Nidhishree on 16/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var wordEntered: UITextField!
    //to replace appid and appkey
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      self.wordEntered.delegate = self    //editing messages over here
        wordMeaning()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wordEntered.resignFirstResponder()
        return true
    }
    //codable way of accesing defination 
    struct Root: Codable {
        let results: [Result]
    }
    struct Result: Codable {
        let lexicalEntries: [Lexical]
    }
    struct Lexical: Codable {
        let entries: [Entry]
    }
    struct Entry: Codable {
        let senses: [Sense]
    }
    struct Sense: Codable {
        let definitions: [String]
    }
    func wordMeaning() {
        
        let appId = "cc996abf"
        let appKey = "ddbf412aaa7d58134da5a78042d34d5a"  //user values
        let language = "en-gb"
        let word = "Terror"
        let fields = "definitions"
        let strictMatch = "false"
        let word_id = word.lowercased()

        guard let url = URL(string: "https://od-api.oxforddictionaries.com/api/v2/entries/\(language)/\(word_id)?fields=\(fields)&strictMatch=\(strictMatch)") else {
            return
        }
        var request = URLRequest(url: url) //creating a request
        request.addValue("application/json", forHTTPHeaderField: "Accept")// response body in json
        request.addValue(appId, forHTTPHeaderField: "app_id") //header of the request sent
        request.addValue(appKey, forHTTPHeaderField: "app_key")
        
        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response,
                let data = data,
                let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print(response)
                print(jsonData)
            } else {
                print(error)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
            }
        }).resume()
        
    }
    
    
    
    }
    





