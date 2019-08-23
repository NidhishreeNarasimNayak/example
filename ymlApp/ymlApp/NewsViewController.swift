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
    
    var allElements: [workElements] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        newsScreenObject()
    }
    
    enum NewsTypes:Int {
        case featured
        case design
        case eBooks
    }
    
    func newsScreenObject() {
        let featuredobject = workElements(imagename: "featured1", headertitle: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors.",url: "https://ymedialabs.com/project/the-north-face")
        let designObject = workElements(imagename: "featured2", headertitle: "CLOVER", description: "How CLover Go has become an open ecosystem for point-of-sale payments.",url: "https://ymedialabs.com/project/clover")
        let eBooksObject = workElements(imagename: "featured3", headertitle: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer.",url: "https://ymedialabs.com/project/credit-one")
        allElements.append(featuredobject)
        allElements.append(designObject)
        allElements.append(eBooksObject)
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allElements.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell
        let element = allElements[indexPath.row]
        cell?.newsScreenImageView.image = UIImage(named: element.imagename)
        cell?.newsScreenTitleLabel.text = element.headertitle
        cell?.newsScreenDescriptionLabel.text = element.description
        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height
    }
    
}





