//
//  ViewController.swift
//  tipper
//
//  Created by Andre Guiraud on 7/26/20.
//  Copyright © 2020 Andre Guiraud. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var billSplit: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        billAmountTextField.becomeFirstResponder()
        
        let defTip = defaults.integer(forKey: "defaultTip")
        tipControl.setValue(Float(defTip), animated: true)
        calculateTip(self)
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
            view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amnt
        let bill = Double(billAmountTextField.text!) ?? 0
        
        
        // Calculate the tip and total
        let tipPercentage = Double(tipControl.value) / 100
        
        let tip = bill * tipPercentage
        let split = billSplit.selectedSegmentIndex + 1
        let total = (bill + tip) / Double(split)
        
        // Update the tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
    }
    
}

