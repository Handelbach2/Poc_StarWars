//
//  ViewController.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
    }
    
    func viewConfig() {
        title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

    }
}

