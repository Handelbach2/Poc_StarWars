//
//  CollectionCell.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    

    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblCell: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewCell.layer.cornerRadius = 10
        viewCell.layer.borderWidth = 1
        viewCell.layer.borderColor = UIColor.yellow.cgColor
        viewCell.layer.backgroundColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
    }

}
