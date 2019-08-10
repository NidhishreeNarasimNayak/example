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
    @IBOutlet weak var textPass: UITextField!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
      //  setStatusBarBackgroundColor(color: UIColor.red)
        headerLabel.layer.masksToBounds = true
        headerLabel.layer.cornerRadius = 20
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 20
        setSubViewCenter()
    }
    
    //function for gesture creation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as? ThirdPageVCViewController
            controller?.textEntered = textPass.text

        }

    }
    func setSubViewCenter() {
        headerLabel.center.x = self.view.frame.maxX/2
       logo.center.x = self.view.frame.maxX/2
        textPass.center.x = self.view.frame.maxX/2
       }
//    func setStatusBarBackgroundColor(color: UIColor) {
//        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {return}
//        statusBar.backgroundColor = color
//    }
    
    

}

