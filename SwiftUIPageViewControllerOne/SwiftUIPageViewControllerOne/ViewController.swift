//
//  ViewController.swift
//  SwiftUIPageViewControllerOne
//
//  Created by NextDot on 2/14/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    //|------------------------------------|
    var pageImages: NSArray!
    var pageViewController: UIPageViewController!
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageImages = NSArray(objects: "image_001", "image_002", "image_003", "image_004")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("RzPageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        let initialContentViewController = self.pageContentHolderAtIndex(0) as UvcPageContentHolder
        let viewControllers = NSArray(object: initialContentViewController)
        //var pageViewController.se = NSArray(object: initialContentViewController as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: UIPageViewControllerNavigationDirection.Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height)
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    @IBAction func sysOnClickBarItemNext(sender: AnyObject) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewControllerWithIdentifier("UvcTheNext") as! UvcTheNext
        //self.presentViewController(viewController, animated: true, completion: nil);
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = viewController
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func pageContentHolderAtIndex(index: Int) -> UvcPageContentHolder
    {
        let pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UvcPageContentHolder") as! UvcPageContentHolder
        pageContentViewController.imageFileName = pageImages[index] as! String
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! UvcPageContentHolder
        var index = viewController.pageIndex as Int
        if(index == 0 || index == NSNotFound)
        {
            return nil
        }
        index--
        return self.pageContentHolderAtIndex(index)
        /*if let controller = viewController as? UvcPageContentHolder {
            if controller.itemIndex > 0 {
                return controllers[controller.itemIndex - 1]
            }
        }
        return nil*/
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let viewController = viewController as! UvcPageContentHolder
        var index = viewController.pageIndex as Int
        if(index == NSNotFound)
        {
            return nil
        }
        index++
        if(index == pageImages.count)
        {
            return nil
        }
        return self.pageContentHolderAtIndex(index)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return pageImages.count
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}