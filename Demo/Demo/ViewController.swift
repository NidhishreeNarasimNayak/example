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
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  setStatusBarBackgroundColor(color: UIColor.red)
        headerLabel.layer.masksToBounds = true
        headerLabel.layer.cornerRadius = 20
        titleLabel.layer.masksToBounds = true
        titleLabel.layer.cornerRadius = 20
        
        setSubViewCenter(isLandscape: false)
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
    func setSubViewCenter(isLandscape: Bool) {
        let centerX = isLandscape ? UIScreen.main.bounds.height/2 : UIScreen.main.bounds.width/2
        print(centerX)
        headerLabel.center.x = centerX
        titleLabel.center.x = centerX
        logo.center.x = centerX
        textPass.center.x = centerX
        nextPageButton.center.x = centerX
        nextButton.center.x = centerX
 }

    //for returning when we press keyboard
    func textFieldShouldReturn(_ textField : UITextField) -> Bool
    {
        print("Inside return")
        textField.resignFirstResponder()
                return true
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            print("Landscape\(self.view.bounds)")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                print("Landscape\(self.view.bounds)")
                self.setSubViewCenter(isLandscape: false)
            }
           
        } else {
            print("Portrait\(self.view.bounds)")
          
            setSubViewCenter(isLandscape: true)
        }
    }
    

}

