//
//  ViewController.swift
//  SwiftLocalNotificationTwo
//
//  Created by NextDot on 1/31/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func sysBtnOnClickNotifyMe(sender: AnyObject) {
        let settings = UIApplication.sharedApplication().currentUserNotificationSettings()
        
        if settings!.types == .None {
            let alertController = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            //return
        }
        let localNotification:UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS swift"
        localNotification.alertTitle = "Rz Local Notification"
        localNotification.alertBody = "This is a local notification";
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 10)
        localNotification.category = "INVITE_CATEGORY";
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
    func scheduleLocalNotification() {
        // Create reminder by setting a local notification
        let localNotification = UILocalNotification() // Creating an instance of the notification.
        localNotification.alertTitle = "Notification Title"
        localNotification.alertBody = "Alert body to provide more details"
        localNotification.alertAction = "ShowDetails"
        localNotification.fireDate = NSDate().dateByAddingTimeInterval(60 * 5) // 5 minutes(60 sec * 5) from now
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.soundName = UILocalNotificationDefaultSoundName // Use the default notification tone/ specify a file in the application bundle
        localNotification.applicationIconBadgeNumber = 1 // Badge number to set on the application Icon.
        localNotification.category = "reminderCategory" // Category to use the specified actions
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification) // Scheduling the notification.
    }
}