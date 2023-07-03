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
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()        
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0 :
            characterView()
            print("Personajes")
        case 1 :
            print("Planetas")
        case 2 :
            print("Peliculas")
        case 3 :
            print("Rzas")
        case 4 :
            print("Vehiculos")
        case 5 :
            print("navez")
        default :
            print("Personajes")
        }
    }
    
}
