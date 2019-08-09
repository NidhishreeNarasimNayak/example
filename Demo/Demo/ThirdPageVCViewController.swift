//
//  ThirdPageVCViewController.swift
//  Demo
//
//  Created by Nidhishree on 09/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ThirdPageVCViewController: UIViewController {
    
    var textEntered: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        let headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 100, y: 150, width: 100, height: 30)
        headerLabel.text = textEntered
        headerLabel.textColor = UIColor.red
        headerLabel.font = UIFont(name: "GillSans-Bold", size: 17)
        headerLabel.numberOfLines = 4
    
        
        // Do any additional setup after loading the view.
        //adding the headerLabel to the viewcontroller
        self.view.addSubview(headerLabel)
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
