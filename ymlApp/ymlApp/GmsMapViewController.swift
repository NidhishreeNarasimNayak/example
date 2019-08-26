//
//  GmsMapViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import GoogleMaps

class GmsMapViewController: UIViewController {
    var latitude = 0.0
    var longitude = 0.0
    var marker: GMSMarker?
    
    @IBOutlet var mapView: GMSMapView!
    override func viewDidLoad() {	
        super.viewDidLoad()
        
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 13.0)
        mapView.camera = camera
        marker = GMSMarker()
        marker?.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker?.map = mapView
    }
}
