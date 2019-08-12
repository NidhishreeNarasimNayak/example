//
//  ViewController.swift
//  Demo
//
//  Created by Nidhishree on 08/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

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
        
        self.textPass.delegate = self
        
    }
    
    //function for gesture creation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let controller = segue.destination as? ThirdPageVCViewController
            controller?.textEntered = textPass.text

        }

    }
    // to set all the subviews in center
    func setSubViewCenter() {
        let centerX = UIScreen.main.bounds.width/2
        headerLabel.center.x = centerX
        titleLabel.center.x = centerX
        logo.center.x = centerX
        textPass.center.x = centerX
        nextPageButton.center.x = centerX
 }
    
//    func setStatusBarBackgroundColor(color: UIColor) {
//        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {return}
//        statusBar.backgroundColor = color
//    }
    //for returning when we press keyboard
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        print("Inside return")
        textField.resignFirstResponder()
        //self.view.endEditing(true)
        return true
    }
}


