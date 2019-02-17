//
//  ViewController.swift
//  GPS
//
//  Created by Mac on 17/02/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import MapKit



class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var textfield: UITextField!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let geo = CLGeocoder()
        geo.geocodeAddressString(textField.text!) { (placemarks, error) in
            let placemark = placemarks?.first
            let location = placemark?.location
            let coordinate = location?.coordinate
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region = MKCoordinateRegion(center: coordinate!, span: span)
            self.map.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
            annotation.title = placemark?.name
            self.map.addAnnotation(annotation)
            
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textfield.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

}

