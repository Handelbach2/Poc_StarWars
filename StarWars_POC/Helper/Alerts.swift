//
//  Alerts.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func simpleErrorAlert(msg: String) {
        // create the alert
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}
