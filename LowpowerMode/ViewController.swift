//
//  ViewController.swift
//  LowpowerMode
//
//  Created by Lokeshwaran on 24/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Check for Low Power Mode when the app loads
        checkLowPowerMode()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Check for Low Power Mode when the app becomes active
        checkLowPowerMode()
    }
    
    func checkLowPowerMode() {
        // Check if Low Power Mode is enabled
        if ProcessInfo.processInfo.isLowPowerModeEnabled {
            print("Low Power Mode is enabled")
            // Show an alert on the main thread
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "Low Power Mode", message: "Your device is in Low Power Mode. This may affect the app's performance and functionality.", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            print("Low Power Mode is not enabled")
        }
    }

    func showLowPowerModeAlert() {
        print("Showing Low Power Mode alert")
        let alertController = UIAlertController(title: "Low Power Mode", message: "Your device is in Low Power Mode. This may affect the app's performance and functionality.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: {
            // Delay to keep the alert visible for a longer period
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                alertController.dismiss(animated: true, completion: nil)
            }
        })
    }
    
}
