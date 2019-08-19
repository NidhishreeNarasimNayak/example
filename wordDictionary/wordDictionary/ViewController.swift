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
       
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wordEntered.resignFirstResponder()
        return true
    }
    
    //to take input from user and display meaning in console
    @IBAction func wordMeaningTapped(_ sender: Any) {
        guard let word = wordEntered.text else { return }
        wordMeaning(text: word)
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
//        let subsenses: [definition]
    }
    
    func wordMeaning(text: String) {
        var storeword: String = ""
        let appId = "cc996abf"
        let appKey = "ddbf412aaa7d58134da5a78042d34d5a"  //user values
        let language = "en-gb"
      // let word = "Terror"
        let fields = "definitions"
        let strictMatch = "false"
        let word_id = text.lowercased()

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
               // print(response)
               // print(jsonData)
                do {
                    let root =  try JSONDecoder().decode(Root.self, from: data)
                   let results = root.results
                    for result in results {
                        for lexical in result.lexicalEntries {
                            for  entry in lexical.entries {
                                for sense in entry.senses {
                                    for definition in sense.definitions {
                                        print(definition)
                                        
//
                                    }
                                }
                            }
                        }
                        
                    }
    
                }
                    
                catch {
                    print(error)
                }
                
            } else {
                print(error)
                print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
            }
        }).resume()
        
    }
    



}

