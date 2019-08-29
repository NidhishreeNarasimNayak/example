//
//  ContactsViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit

class ContactsViewController: BaseViewController {
    
    
    
    @IBOutlet weak var locationLabel1: UILabel!
    @IBOutlet weak var locationLabel2: UILabel!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    var contactType = ContactsViewModel()
    var locationTapGesture1: UITapGestureRecognizer!
    var locationTapGesture2: UITapGestureRecognizer!
    
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
        if let phonenumber = contactLabel.text {
            openApp(raw: phonenumber, appType: .phone)
            self.alertNotify(title: "Call \(String(describing: phonenumber))?", message: "select your prefered action", style: .alert, actions: [alertAction(title: "Call", style: .default,handler: nil), alertAction(title: "Cancel", style: .cancel, handler: nil)])
        }
    }
    
    
    @objc func actionTappedMail(_ sender: UITapGestureRecognizer) {
        if let mail = lblMail.text {
            openApp(raw: mail, appType: .mail)
            self.alertNotify(title: "Mail \(String(describing: mail))?", message: "select your prefered action", style: .alert, actions: [alertAction(title: "Mail", style: .default, handler: nil), alertAction(title: "Cancel", style: .cancel, handler: nil)])
        }
    }
    @objc func showLocationOnMaps(_ sender: UITapGestureRecognizer){
        var lati = 0.0
        var longi = 0.0
        if sender == locationTapGesture1{
            lati = contactType.locations.siliconValley.latitude
            longi = contactType.locations.siliconValley.longitude
            
        }
        else
        {
            lati = contactType.locations.bangalore.latitude
            longi = contactType.locations.bangalore.longitude
        }
        let appleMaps = alertAction(title: "Apple Maps", style: .default, handler: { (alertAction) in
            self.openApp(raw: "", appType: .appleMaps, latitude: lati, longitude: longi)
        })
        let googleMaps = alertAction(title: "Google Maps", style: .default,handler: { (alertAction) in
            self.openApp(raw: "", appType: .googleMaps, latitude: lati, longitude: longi)
        })
        let cancel = alertAction(title: "Cancel", style: .cancel, handler: nil)
        alertNotify(title: "Open location", message: "", style: .actionSheet, actions: [appleMaps,googleMaps,cancel])
        
    }
}

extension  ContactsViewController {
    func openApp(raw: String, appType: AppType, latitude: Double? = nil, longitude: Double? = nil){
        var url = raw
        switch appType {
        case .phone:
            url = "tel://" + url
        case .mail:
            url = "mailto:" + url
        case .googleMaps:
            if let lat = latitude,  let long = longitude {
                url = "comgooglemaps://?saddr=&daddr=\(lat),\(long)&directionsmode=driving"
            }
        case .appleMaps:
            if let latitude = latitude, let longitude = longitude {
                let query = "?daddr=\(String(describing: latitude)),\(String(describing: longitude))"
                url = "http://maps.apple.com/\(query)&dirflg=d&t=h"
                
            }
        }
        
        if let url = URL(string: url){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url)
            }
        }
    }
}

enum AppType
{
    case phone
    case mail
    case googleMaps
    case appleMaps
}
