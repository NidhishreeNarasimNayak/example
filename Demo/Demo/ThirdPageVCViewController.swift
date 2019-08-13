//
//  ThirdPageVCViewController.swift
//  Demo
//
//  Created by Nidhishree on 09/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ThirdPageVCViewController: UIViewController {
    var headerLabel: UILabel!
    var textEntered: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createHeaderLabel()
        }
    
    func createHeaderLabel() {
        
        //creating a headerLabel for third View
        headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 200, y: 150, width: 100, height: 30)
        headerLabel.text = textEntered
        headerLabel.textColor = UIColor.red
        headerLabel.font = UIFont(name: "GillSans-Bold", size: 17)
        headerLabel.numberOfLines = 4
        self.view.addSubview(headerLabel)
        
    }
    //func to animate headerLabel
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 5, animations:{
           self.headerLabel.center.y += 200
           // self.headerLabel.center.x += 100
            } )
        }
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}
