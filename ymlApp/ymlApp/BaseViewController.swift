//
//  BaseViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 28/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

struct  alertAction {
   var title: String
    var style: UIAlertAction.Style
    var handler: ((UIAlertAction) -> Void)?
}
/// class which contains alertController and its actions 
class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
}
    func alertNotify(title: String, message: String, style: UIAlertController.Style, actions: [alertAction]){
            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            for item in actions{
                alertController.addAction(UIAlertAction(title: item.title, style: item.style, handler: item.handler))
            }
            present(alertController, animated: true, completion: nil)
        }
}
    



