//
//  ViewController.swift
//  SwiftURLImageLoad
//
//  Created by NextDot on 2/6/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //|------------------------------------|
    @IBOutlet var sysImageView: UIImageView!
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    @IBAction func sysBtnOnClickLoadImage(sender: AnyObject) {
        print("RZ_MSG:- Clicked sysBtnOnClickLoadImage");
        let requestUrl: String = "https://pbs.twimg.com/profile_images/540347687015428096/9YYjnEt9.jpeg"
        imageDownloadedFromUrl(requestUrl)
    }
    func imageDownloadedFromUrl(argRequestUrl: String)
    {
        //let requestUrl = NSURL(string: argRequestUrl)
        let request = NSMutableURLRequest(URL: NSURL(string: argRequestUrl)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { responseData, response, error in
            print("RZ_SUCCESS_MSG:- post request");
            if (error == nil) {
                //print("RZ_SUCCESS_MSG:- Ok \(responseData)");
                if let httpResponse = response as? NSHTTPURLResponse {
                    print("RZ_SUCCESS_MSG:- response code:- \(httpResponse.statusCode)");
                    switch httpResponse.statusCode {
                    case 200:
                        let mimeType = response!.MIMEType;
                        //where mimeType.hasPrefix("image")
                        print("RZ_MSG:- \(mimeType)");
                        if(mimeType!.hasPrefix("image"))
                        {
                            let image = UIImage(data: responseData!)
                            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                                let imageTemp: UIImage = image!.imageResize(image!, scaledToSize: CGSizeMake(self.view.frame.width, self.view.frame.height))
                                self.sysImageView.image = imageTemp
                            }
                        }
                        break;
                    default:
                        print("RZ_SUCCESS_MSG:- response code:- \(httpResponse.statusCode)");
                    }
                }
            } else {
                print("RZ_ERROR_MSG:- \(error!.description)");
            }
        }
        task.resume();
        /*let requestUrl = NSURL(string: argRequestUrl)
        NSURLSession.sharedSession().dataTaskWithURL(requestUrl!, completionHandler: { (data, response, error) -> Void in
            guard
                let httpURLResponse = response as? NSHTTPURLResponse where httpURLResponse.statusCode == 200,
                let mimeType = response?.MIMEType where mimeType.hasPrefix("image"),
                let data = data where error == nil,
                let image = UIImage(data: data)
                else { return }
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                self.sysImageView.image = image
            }
        }).resume()*/
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}