//
//  StarView.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class StarView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Configura la apariencia de la estrella
        backgroundColor = UIColor.white
        // Configura cualquier otra personalización que desees
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
