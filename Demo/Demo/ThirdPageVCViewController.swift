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
            //creating a secondLabel for third view
//        let secondLabel = UILabel()
//        secondLabel.frame = CGRect(x:200,y:300, width: 100,height: 40)
//        secondLabel.backgroundColor = UIColor.red
       
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
    

   

}
