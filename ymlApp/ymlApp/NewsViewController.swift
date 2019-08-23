//
//  NewsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 23/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var newsSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum NewsTypes:Int {
        case featured
        case design
        case eBooks
    }

//    @IBAction func indexChanged(_ sender: UISegmentedControl) {
//        
//        switch  newsSegmentControl.selectedSegmentIndex {
//
//
//        default:
//            <#code#>
//        }
//
//
//    }
//    func newsScreenObject() {
//        let featuredobject = workElements(imagename: "northFace", headertitle: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors.",url: "https://ymedialabs.com/project/the-north-face")
//        let designObject = workElements(imagename: "cloverGo", headertitle: "CLOVER", description: "How CLover Go has become an open ecosystem for point-of-sale payments.",url: "https://ymedialabs.com/project/clover")
//        let eBooksObject = workElements(imagename: "creditOne", headertitle: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer.",url: "https://ymedialabs.com/project/credit-one")
//        workScreenElements = [northFace, cloverGo,creditOne]
//    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell
        return cell ?? UITableViewCell()
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}




//extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//      return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return
//    }
//
//
//}
