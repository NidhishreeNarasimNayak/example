//
//  ViewController.swift
//  Demo
//
//  Created by Nidhishree on 08/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
    }

    @IBAction func onCLickButton(_ sender: Any) {
        headerLabel.frame.origin = CGPoint(x: 56, y: 200)
    }
    
}

