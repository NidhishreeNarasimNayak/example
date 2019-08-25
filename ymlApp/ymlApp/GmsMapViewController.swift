//
//  GmsMapViewController.swift
//  ymlApp
//
//  Created by Nidhishree on 24/08/19.
//  Copyright © 2019 YML. All rights reserved.
//

import UIKit
import GoogleMaps
//let marker = GMSMarker()
class GmsMapViewController: UIViewController {
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    let marker = GMSMarker()

    @IBOutlet var mapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
  let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: -37.8136, longitude: 144.9631, zoom: 4.0)
        mapView.camera = camera
           // marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        let marker = GMSMarker()
       // marker.title = "Sydney"
       // marker.snippet = "Aus"
        marker.map = mapView
    }
    

   
}
