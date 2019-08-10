//
//  secondPageVCViewController.swift
//  Demo
//
//  Created by Nidhishree on 08/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class SecondPageVCViewController: UIViewController {
var textPass = ""
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var secondPageHeaderLabel: UILabel!
    
    var viewColorChange : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondPageHeaderLabel.layer.masksToBounds = true //used in order to edit changes to header label
        colorChangeLabel()

        
    }
    


    func colorChangeLabel()
    {
        
//        viewColorChange = UIView()
//        viewColorChange.frame = CGRect(x:0,y:0,width: 100,height:100 )
//        viewColorChange.center = self.view.center
       // self.view.addSubview(viewColorChange)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(changeViewColor))
        tapGesture.numberOfTapsRequired = 1
        secondPageHeaderLabel.isUserInteractionEnabled = true
        secondPageHeaderLabel.addGestureRecognizer(tapGesture)
        
    }
    @objc func changeViewColor(sender: UITapGestureRecognizer)
    {
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
       // viewColorChange.backgroundColor = randomColor
        self.view.backgroundColor = randomColor
    }
    
   
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
