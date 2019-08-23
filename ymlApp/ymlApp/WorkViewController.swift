//
//  WorkViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 21/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class WorkViewController: UIViewController {
    
    @IBOutlet weak var workTableView: UITableView!
    
    var workScreenElements: [workElements] = [] //creating an array of objects
    
    override func viewDidLoad() {
        super.viewDidLoad()
        workScreenObjects()
        
    }
    
    func workScreenObjects() {
        let northFace = workElements(imagename: "northFace", headertitle: "THE NORTH FACE", description: "How The North Face redefined loyalty to embrace the great outdoors.",url: "https://ymedialabs.com/project/the-north-face")
        let cloverGo = workElements(imagename: "cloverGo", headertitle: "CLOVER", description: "How CLover Go has become an open ecosystem for point-of-sale payments.",url: "https://ymedialabs.com/project/clover")
        let creditOne = workElements(imagename: "creditOne", headertitle: "CREDIT ONE", description: "How Credit One has become America's fastest growing credit card issuer.",url: "https://ymedialabs.com/project/credit-one")
        workScreenElements = [northFace, cloverGo,creditOne]
        
    }
    
}

extension WorkViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workScreenElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as? WorkTableViewCell
        let element = workScreenElements[indexPath.row]
        cell?.workScreenImage.image = UIImage(named: element.imagename)
        cell?.workScreenTitle.text = element.headertitle
        cell?.workScreenDescription.text = element.description
        return cell ?? UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transitionToVc = self.storyboard?.instantiateViewController(withIdentifier: "WorkWebViewViewController") as! WorkWebViewViewController
        transitionToVc.url = URL(string: workScreenElements[indexPath.row].geturl())
        self.navigationController?.pushViewController(transitionToVc, animated: true)
    }
    
}
//structure for all my static elements
struct workElements {
    let imagename: String
    let headertitle: String
    let description: String
    let url:String
    func geturl() -> String {
        return url
    }
}
