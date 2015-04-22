//
//  ViewController.swift
//  Tipster
//
//  Created by Cece Yu on 4/13/15.
//  Copyright (c) 2015 Cece Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var receiptContainer: UIView!
    @IBOutlet weak var tipControlSlider: UISlider!
    @IBOutlet weak var sliderBackground: UIView!
    @IBOutlet weak var percentageLabel: UILabel!
    
    // customize stuff in your view after it's loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the inital text in each field
        billField.text = "$0.00"
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Makes sure the keyboard pops up upon load
        billField.becomeFirstResponder()
        
        receiptContainer.layer.cornerRadius = 8.0
        
        sliderBackground.layer.cornerRadius = 4.0
        
        // GUI settings for these sliders don't work, so we need to 
        // reproduce the settings in code, here.
        tipControlSlider.minimumTrackTintColor = UIColor.clearColor()
        tipControlSlider.maximumTrackTintColor = UIColor.clearColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipControlSlider.value
        
        var subBill = (billField.text as NSString).substringFromIndex(1)
        var billAmount = (subBill as NSString).floatValue
        
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        billField.text = "$" + subBill
        
        // Converts tipPercentage to string, multiplies it by 100 and adds a percent
        percentageLabel.text = String(format: "%d", Int(tipPercentage * 100)) + "%"
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

