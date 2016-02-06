//
//  ViewController.swift
//  SwiftHttpRequestOne
//
//  Created by NextDot on 2/6/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //|------------------------------------|
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
    @IBAction func sysBtnOnClickPost(sender: AnyObject) {
        print("RZ_MSG:- Clicked sysBtnOnClickPost");
        let url = "http://nextdot.com.au/auscab/app/login";
        //let urlParameter:[String: String] = ["user_name": "Rz Rasel", "user_password": "123456"];
        let urlParameter:[String: String] = ["user_email": "email", "user_password": "pass", "device_auth": "7:10:11:3"]
        self.HttpPostRequest(url, argUrlParameter: urlParameter);
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    @IBAction func sysBtnOnClickGet(sender: AnyObject) {
        print("RZ_MSG:- Clicked sysBtnOnClickGet");
        let url = "https://www.google.com.bd/#q=color+scheme";
        self.HttpGettRequest(url);
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func HttpQueryString(argUrlParameter: Dictionary<String, String>) -> String
    {
        //|------------------------------------|
        print("Count \(argUrlParameter.count)")
        var postString = "";
        var paramCounter = 0;
        //|------------------------------------|
        for (key, value) in argUrlParameter
        {
            //|------------------------------------|
            paramCounter++;
            /*let scapedKey = key.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!
            let scapedValue = value.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())!*/
            let scapedKey = key;
            let scapedValue = value;
            postString += scapedKey + "=" + scapedValue;
            if(paramCounter < argUrlParameter.count)
            {
                postString += "&"
            }
            //|------------------------------------|
        }
        //|------------------------------------|
        return postString;
        //|------------------------------------|
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func HttpPostRequest(argRequestUrl: String, argUrlParameter: Dictionary<String, String>)
    {
        var postString = "";
        postString = HttpQueryString(argUrlParameter)
        print("RZ_MSG:- \(postString)")
        //|------------------------------------|
        let postData:NSData = postString.dataUsingEncoding(NSUTF8StringEncoding)!;
        let request = NSMutableURLRequest(URL: NSURL(string: argRequestUrl)!)
        request.HTTPMethod = "POST"
        request.HTTPBody = postData;
        //|------------------------------------|
        print("RZ_MSG:- \(request)");
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { responseData, response, error in
            print("RZ_SUCCESS_MSG:- post request");
            if (error == nil) {
                //print("RZ_SUCCESS_MSG:- Ok \(responseData)");
                if let httpResponse = response as? NSHTTPURLResponse {
                    print("RZ_SUCCESS_MSG:- response code:- \(httpResponse.statusCode)");
                    switch httpResponse.statusCode {
                    case 200:
                        let alert = UIAlertController(title: "Success Message", message: "Successfully post data", preferredStyle: UIAlertControllerStyle.Alert);
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil));
                        self.presentViewController(alert, animated: true, completion: nil);
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
        //|------------------------------------|
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func HttpGettRequest(argRequestUrl: String)
    {
        //|------------------------------------|
        let request = NSMutableURLRequest(URL: NSURL(string: argRequestUrl)!)
        request.HTTPMethod = "GET"
        //request.HTTPBody = postData;
        //|------------------------------------|
        print("RZ_MSG:- \(request)");
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { responseData, response, error in
            print("RZ_SUCCESS_MSG:- get request");
            if (error == nil) {
                //print("RZ_SUCCESS_MSG:- Ok \(responseData)");
                if let httpResponse = response as? NSHTTPURLResponse {
                    print("RZ_SUCCESS_MSG:- response code:- \(httpResponse.statusCode)");
                    switch httpResponse.statusCode {
                    case 200:
                        let alert = UIAlertController(title: "Success Message", message: "Successfully get data", preferredStyle: UIAlertControllerStyle.Alert);
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil));
                        self.presentViewController(alert, animated: true, completion: nil);
                        break;
                    default:
                        print("RZ_SUCCESS_MSG:- response code:- \(httpResponse.statusCode)");
                    }
                }
            } else {
                print("RZ_ERROR_MSG:- \(error!.description)");
            }
        }
        task.resume()
        //|------------------------------------|
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}