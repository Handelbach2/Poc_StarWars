//
//  ProfileVC.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var imgProf: UIImageView!
    @IBOutlet weak var nameProf: UILabel!
    @IBOutlet weak var heightProf: UILabel!
    @IBOutlet weak var massProf: UILabel!
    @IBOutlet weak var hairProf: UILabel!
    @IBOutlet weak var skinProf: UILabel!
    @IBOutlet weak var eyeProf: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    @IBOutlet weak var birthProf: UILabel!
    var profile: ResultsCharStruct?
    var url: String?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
    }
    
    func getProfile() {
        API.shared.getProfileChar(url: self.url!) { res in
            self.profile = res
            self.viewConfig()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func viewConfig() {
        viewProfile.layer.cornerRadius = 10
        viewProfile.layer.borderWidth = 1
        viewProfile.layer.borderColor = UIColor.yellow.cgColor
        
       
        
        imgProf.image = UIImage(named: profile!.name!)
        nameProf.text = profile!.name!
        heightProf.text = "Height: \(profile!.height!) cm"
        massProf.text = "Mass: \(profile!.mass!) Kg"
        hairProf.text = "Hair color: \(profile!.hair_color!)"
        skinProf.text = "Skin color: \(profile!.skin_color!)"
        eyeProf.text = "eye color: \(profile!.eye_color!)"
        birthProf.text = "Birth year: \(profile!.birth_year!)"
        gender.text = "Birth year: \(profile!.gender!)"
        
        if let image = UIImage(named: profile!.name!) {
            // La imagen se cargó correctamente
        } else {
            // El nombre de la imagen es incorrecto o la imagen no existe
            imgProf.image = UIImage(systemName: "person.circle" )
        }
    }
    
    
    @IBAction func filmBtnAct(_ sender: Any) {
        
    }
    
    @IBAction func speciesBtnAct(_ sender: Any) {
        
    }
    
    @IBAction func vehicleBtnAct(_ sender: Any) {
        
    }
    
    @IBAction func starshipBtnAct(_ sender: Any) {
        
    }
}
