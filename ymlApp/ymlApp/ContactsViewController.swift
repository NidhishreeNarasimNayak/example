//
//  ContactsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var lblMail: UILabel!
    
    @IBOutlet weak var contactLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let contactTap = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        let mailTap = UITapGestureRecognizer(target:self, action: Selector(("actionTappedMail:")))
        contactLabel.addGestureRecognizer(contactTap)
        lblMail.addGestureRecognizer(mailTap)
    }
    
    @objc func actionTapped(_ sender: UITapGestureRecognizer) {
        if let phoneURL = URL(string: ("tel://" + "8152024536")) {
            let alert = UIAlertController(title: ("Call " + "8152024536" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @objc func actionTappedMail(_ sender: UITapGestureRecognizer) {
        if let mailUrl = URL(string: ("mailto://" + "nidhishree.nayak@ymedialabs.com")) {
            let alert = UIAlertController(title: ("Mail " + "nidhishree.nayak@ymedialabs.com" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Mail", style: .default, handler: { (action) in
                UIApplication.shared.open(mailUrl as URL, options: [:], completionHandler: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
}
