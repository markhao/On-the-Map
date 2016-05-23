//
//  SubmitLoactionViewController.swift
//  On the Map
//
//  Created by Yu Qi Hao on 5/22/16.
//  Copyright © 2016 Yu Qi Hao. All rights reserved.
//

import MapKit
import UIKit

class SubmitLoactionViewController: UIViewController {
    
    
    //MARK: -Properties
    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var submitBtn: UIButton!
    
    var mapItem : MKMapItem?
    var queryString: String?
    
    var placeHolder : NSAttributedString {
        get {
            return NSAttributedString(string: "Enter a Link to Share Here", attributes: Utilities.TextFieldPlaceHolderAttr)
        }
    }
    
    
    //MARK: -Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupButton(submitBtn)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupMapView()
    }
    
    
    //MARK: -IBActions
    @IBAction func submitLocation(sender: AnyObject) {
        guard let link = linkTextField.text where link != "" else {
            showAlertViewWith("Oops!", error: "Link can't be blank.", type: .AlertViewWithOneButton , firstButtonTitle: "OK", firstButtonHandler: nil, secondButtonTitle: nil, secondButtonHandler: nil)
            return
        }
        
        OTMNavigationViewController.postStudentLocationFrom(link, location: queryString!)
        
    }
}


//MARK: -UITextFieldDelegate
extension SubmitLoactionViewController : UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text == "" {
            textField.attributedText = placeHolder
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

//UI related methods
extension SubmitLoactionViewController {
    
    private func setUIEnabled(enabled: Bool) {
        submitBtn.enabled = enabled
        linkTextField.enabled = enabled
    }
    
    
    private func setupTextField() {
        linkTextField.delegate = self
        linkTextField.attributedText = placeHolder
    }
    
    private func setupMapView() {
        if let mapItem = mapItem {
            let coordinate = mapItem.placemark.coordinate
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            mapView.addAnnotation(annotation)
            mapView.setCenterCoordinate(coordinate, animated: true)
        }
    }
}
