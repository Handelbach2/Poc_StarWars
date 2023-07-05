//
//  PlanetsProf.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class PlanetsProf: UIViewController {
    
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var rotation: UILabel!
    @IBOutlet weak var orbital: UILabel!
    @IBOutlet weak var diameter: UILabel!
    @IBOutlet weak var climate: UILabel!
    @IBOutlet weak var gravity: UILabel!
    @IBOutlet weak var terrain: UILabel!
    @IBOutlet weak var population: UILabel!
    
    
    var url: String?
    var profile: planetBody?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
        // Do any additional setup after loading the view.
    }
    

    func getProfile() {
        API.shared.getProfilePlanet(url: self.url!) { res in
            self.profile = res
            self.viewConfig()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func viewConfig() {
        img.image = UIImage(named: profile!.name!)
        name.text = profile!.name!
        rotation.text = "Rotation: \(profile!.rotation_period!)"
        orbital.text = "Orbital: \(profile!.orbital_period!)"
        diameter.text = "Diameter: \(profile!.diameter!)"
        climate.text = "Climate: \(profile!.climate!)"
        gravity.text = "Gravity: \(profile!.gravity!)"
        terrain.text = "Terrain: \(profile!.terrain!)"
        population.text = "Population: \(profile!.population!)"
        
        if let image = UIImage(named: profile!.name!) {
            // La imagen se cargó correctamente
        } else {
            // El nombre de la imagen es incorrecto o la imagen no existe
            img.image = UIImage(systemName: "person.circle" )
        }
    }
}
