//
//  ContactsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
   
    
    @IBOutlet weak var locationLabel1: UILabel!
    @IBOutlet weak var locationLabel2: UILabel!
    
    
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    var locationTapGesture1: UITapGestureRecognizer!
    var locationTapGesture2: UITapGestureRecognizer!
    var SVlat = 37.52950
    var SVlong = -122.258507
    var BangaloreLat = 12.9715
    var BangaloreLong = 77.5945
    
    
    //var address
    override func viewDidLoad() {
        super.viewDidLoad()
        addTapGestures()
    }
    func addTapGestures() {
        let contactTap = UITapGestureRecognizer(target:self, action: Selector(("actionTapped:")))
        let mailTap = UITapGestureRecognizer(target:self, action: Selector(("actionTappedMail:")))
        contactLabel.addGestureRecognizer(contactTap)
        lblMail.addGestureRecognizer(mailTap)
        locationTapGesture1 = UITapGestureRecognizer(target: self, action: Selector(("showLocationOnMaps:")))
        locationTapGesture2 = UITapGestureRecognizer(target: self, action: #selector(showLocationOnMaps(_:)))
        locationLabel1.addGestureRecognizer(locationTapGesture1)
        locationLabel2.addGestureRecognizer(locationTapGesture2)
        
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
    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        
        if sender == locationTapGesture1{
            if let googleMapsVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: GmsMapViewController.self)) as? GmsMapViewController
            {
                
                googleMapsVC.latitude = Double(SVlat)
                googleMapsVC.longitude = Double(SVlong)
                googleMapsVC.marker?.title = "California"
                googleMapsVC.marker?.snippet = "USA"
                self.navigationController?.pushViewController(googleMapsVC, animated: true)
            }
        }
            
        else{
            if let googleMapsVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: GmsMapViewController.self)) as? GmsMapViewController
            {
                googleMapsVC.latitude = Double(BangaloreLat)
                googleMapsVC.longitude = Double(BangaloreLong)
                googleMapsVC.marker?.title = "Bangalore"
                googleMapsVC.marker?.snippet = "India"
                self.navigationController?.pushViewController(googleMapsVC, animated: true)
            }
            
        }
    }
}

