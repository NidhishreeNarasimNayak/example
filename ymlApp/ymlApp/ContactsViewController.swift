//
//  ContactsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var contactLabel: UILabel!
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        if let phoneURL = NSURL(string: ("tel://" + "8152024536")) {
            let alert = UIAlertController(title: ("Call " + "8152024536" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        contactLabel.addGestureRecognizer(tap)
    }
//    @objc func actionTappedMail(_sender: UITapGestureRecognizer) {
//        if let mailUrl = URL(string: "Mail://" + "bhjdgshjdghj")) {
//    }
}
