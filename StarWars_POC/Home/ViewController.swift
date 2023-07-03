//
//  ViewController.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets
    @IBOutlet weak var collection: UICollectionView!
    
    //vars
    var sections: [String] = []
    var imgs: [UIImage?] = []
    var des: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
        generateStars()
        collectionConfig()
    }
    
    func viewConfig() {
        sections = Globals.shared.sections
        imgs = Globals.shared.imgs
        des = Globals.shared.desc
        title = "Home"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func collectionConfig() {
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "homeCell")
    }
   

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vc = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCell", for: indexPath) as! HomeCell
        vc.imgCell.image = imgs[indexPath.row]
        vc.lblCell.text = sections[indexPath.row]
        vc.desc.text = des[indexPath.row]
        return vc
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
