//
//  SettingsViewController.swift
//  tipper
//
//  Created by Andre Guiraud on 7/28/20.
//  Copyright © 2020 Andre Guiraud. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UITextField!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tipVal = defaults.integer(forKey: "defaultTip")
        
        if tipVal == 0 {
            tipVal = 15
            defaults.set(tipVal, forKey: "defaultTip")
            defaults.synchronize()
        }
       
        defaultTip.text = String(tipVal)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func defEdited(_ sender: UITextField) {
        var newVal = Int(defaultTip.text!)
        if newVal! > 100 {
            newVal = 100
        }
        defaults.set(newVal, forKey: "defaultTip")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
