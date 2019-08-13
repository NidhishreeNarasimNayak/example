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
        
     //notification called when it goes to background
  NotificationCenter.default.addObserver(self, selector: #selector(onWillGoBackground),name:UIApplication.willResignActiveNotification, object: nil)
        
        //notification called when comes to foreground
        NotificationCenter.default.addObserver(self, selector: #selector(willComeToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string == "")
        {
            return true    //for backspace 
        }
        if (( string.rangeOfCharacter(from: CharacterSet.letters) ) != nil)
       {
        return true
        }
        else
       {
        return false
        }
    }
    
    

    //    @objc func textFieldDidChangeAction() {
//        print(textPass?.text as Any)
//        textPass.text?.components(separatedBy: CharacterSet.capitalizedLetters)
//
//    }
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
    //calling notification when the app goes to background
    @objc func onWillGoBackground(_ notification : Notification){
        self.view.backgroundColor = UIColor.lightGray
    }
    //calling function when it comes to foreground
    @objc func willComeToForeground(_notification : Notification)
    {
        self.view.backgroundColor = UIColor.green
    }

   
}

