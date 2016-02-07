//
//  ViewController.swift
//  SwiftCLLocationManagerOne
//
//  Created by NextDot on 2/7/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    //|------------------------------------|
    var locationManager: CLLocationManager!
    @IBOutlet var sysLabelCoreLocation: UILabel!
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sysLabelCoreLocation.text = "Location"
        funInitLocationManager()
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func funInitLocationManager()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        // check & allow location manager
        if CLLocationManager.authorizationStatus() == CLAuthorizationStatus.NotDetermined {
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    var locCounter = 0;
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        locCounter++
        let location:CLLocation = locations.last!
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        var latLng: String
        //latLng = "Location - Latitude: " + latitude + " - Longitude: " + longitude
        latLng = "Location\nLatitude: \(latitude) - Longitude: \(longitude)"
        //latLng = sysLabelCoreLocation.text! + "\n" + latLng
        
        sysLabelCoreLocation.text = latLng
        if(locCounter % 2 == 0)
        {
            sysLabelCoreLocation.text = ""
        }
        print("Location:- \(latitude) - \(longitude)");
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        if (error != "") {
            print("Update Location Error : \(error.description)")
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func updateLocation(currentLocation:CLLocation){
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        print("Location:- \(latitude) - \(longitude)");
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}