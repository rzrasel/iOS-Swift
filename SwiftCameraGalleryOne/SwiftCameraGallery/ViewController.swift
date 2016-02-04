//
//  ViewController.swift
//  SwiftCameraGallery
//
//  Created by NextDot on 2/3/16.
//  Copyright © 2016 RzRasel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //|------------------------------------|
    @IBOutlet var sysImageViewDisplay: UIImageView!
    let imagePickerController = UIImagePickerController()
    //|------------------------------------|
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePickerController.delegate = self   //the required delegate to get a photo back to the app.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    func noCamera(){
        let alertVC = UIAlertController(
            title: "No Camera",
            message: "Sorry, this device has no camera",
            preferredStyle: .Alert)
        let okAction = UIAlertAction(
            title: "OK",
            style:.Default,
            handler: nil)
        alertVC.addAction(okAction)
        presentViewController(
            alertVC,
            animated: true,
            completion: nil)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    //get a photo from the library / gallery.
    @IBAction func sysPhotoFromGallery(sender: AnyObject) {
        imagePickerController.allowsEditing = false //2
        imagePickerController.sourceType = .PhotoLibrary //3
        imagePickerController.modalPresentationStyle = .Popover
        presentViewController(imagePickerController, animated: true, completion: nil)//4
        imagePickerController.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    //take / shoot a picture, check if we have a camera first.
    @IBAction func sysPhotoFromCamera(sender: AnyObject) {
        if UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil {
            imagePickerController.allowsEditing = false
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            imagePickerController.cameraCaptureMode = .Photo
            imagePickerController.modalPresentationStyle = .FullScreen
            presentViewController(imagePickerController, animated: true, completion: nil)
        } else {
            noCamera()
        }
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    //MARK: - Delegates
    //What to do when the picker returns with a photo
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        sysImageViewDisplay.contentMode = .ScaleAspectFit //3
        let chosenImageTemp: UIImage = chosenImage.imageResize(chosenImage, scaledToSize: CGSizeMake(self.view.frame.width, self.view.frame.height))
        sysImageViewDisplay.image = chosenImageTemp //4
        dismissViewControllerAnimated(true, completion: nil) //5
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
    //What to do if the image picker cancels.
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    //|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
}