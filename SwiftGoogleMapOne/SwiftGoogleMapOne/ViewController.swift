//
//  ViewController.swift
//  SwiftGoogleMapOne
//
//  Created by NextDot on 2/7/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMSMapViewDelegate {
    var googleMapView: GMSMapView!
    @IBOutlet var sysGoogleMapView: GMSMapView!
    var marker = GMSMarker()
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selfViewMapView()
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func selfViewMapView()
    {
        let camera = GMSCameraPosition.cameraWithLatitude(23.817012, longitude: 90.410389, zoom: 12)
        googleMapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.googleMapView.myLocationEnabled = true
            self.googleMapView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            self.googleMapView.myLocationEnabled = true
            self.googleMapView.indoorEnabled = false
            self.googleMapView.settings.myLocationButton = true
            self.googleMapView.indoorEnabled = false
            self.googleMapView.accessibilityElementsHidden = false
            self.googleMapView.settings.compassButton = true;
            self.googleMapView.settings.zoomGestures = true;
            self.googleMapView.mapType = kGMSTypeNormal
        })
        self.view = googleMapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(23.817012, 90.410389)
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.title = "Dhaka"
        marker.snippet = "Bangladesh"
        marker.map = googleMapView
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}