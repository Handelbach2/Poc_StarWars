//
//  SpeciesProf.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class SpeciesProf: UIViewController {
    
    @IBOutlet weak var viewProf: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var namePRof: UILabel!
    @IBOutlet weak var classification: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var everage: UILabel!
    @IBOutlet weak var skin: UILabel!
    @IBOutlet weak var hair: UILabel!
    @IBOutlet weak var eye: UILabel!
    @IBOutlet weak var lenguaje: UILabel!
    
    var url: String?
    var profile: SpeciesStruct?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
        // Do any additional setup after loading the view.
    }
    
    func getProfile() {
        API.shared.getProfileSpecies(url: self.url!) { res in
            self.profile = res
            self.viewConfig()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func viewConfig() {
        viewProf.layer.cornerRadius = 10
        viewProf.layer.borderWidth = 1
        viewProf.layer.borderColor = UIColor.yellow.cgColor
        
        img.image = UIImage(named: profile!.name ?? "")
        namePRof.text = profile!.name!
        classification.text = "Classification: \(profile!.classification!)"
        designation.text = "Designation: \(profile!.designation!)"
        everage.text = "Height: \(profile!.average_height!) cm"
        skin.text = "Skin color: \(profile!.skin_colors!)"
        hair.text = "Hair color: \(profile!.hair_colors!)"
        eye.text = "Eye colors: \(profile!.eye_colors!)"
        lenguaje.text = "Lenguage: \(profile!.language!)"
        
        if let image = UIImage(named: profile!.name!) {
            // La imagen se cargó correctamente
        } else {
            // El nombre de la imagen es incorrecto o la imagen no existe
            img.image = UIImage(systemName: "person.circle" )
        }
    }

}
