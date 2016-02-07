//
//  ViewController.swift
//  SwiftGoogleMapTwo
//
//  Created by NextDot on 2/7/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    //|------------------------------------|
    @IBOutlet var sysGoogleMapView: GMSMapView!
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        customViewGoogleMapView();
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func customViewGoogleMapView()
    {
        //|------------------------------------|
        let camera = GMSCameraPosition.cameraWithLatitude(23.817012, longitude: 90.410389, zoom: 12)
        sysGoogleMapView.camera = camera
        //|------------------------------------|
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.sysGoogleMapView.myLocationEnabled = true
            self.sysGoogleMapView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
            self.sysGoogleMapView.myLocationEnabled = true
            self.sysGoogleMapView.indoorEnabled = false
            self.sysGoogleMapView.settings.myLocationButton = true
            self.sysGoogleMapView.indoorEnabled = false
            self.sysGoogleMapView.accessibilityElementsHidden = false
            self.sysGoogleMapView.settings.compassButton = true;
            self.sysGoogleMapView.settings.zoomGestures = true;
            self.sysGoogleMapView.mapType = kGMSTypeNormal
        })
        //|------------------------------------|
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(23.817012, 90.410389)
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.title = "Dhaka"
        marker.snippet = "Bangladesh"
        marker.map = sysGoogleMapView
        //|------------------------------------|
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    /*
    HELP LINK:-
    https://developers.google.com/maps/documentation/ios-sdk/start
    https://kodesnippets.wordpress.com/2015/07/09/google-maps-with-custom-view-in-ios/
    */
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}