//
//  VehiclesProf.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class VehiclesProf: UIViewController {
    
    @IBOutlet weak var viewProf: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var nameProf: UILabel!
    @IBOutlet weak var modelProf: UILabel!
    @IBOutlet weak var manu: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var lenght: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var pass: UILabel!
    @IBOutlet weak var cargo: UILabel!
    
    var url: String?
    var profile: VehicleStruct?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
        // Do any additional setup after loading the view.
    }
    
    func getProfile() {
        API.shared.getProfileVehicle(url: self.url!) { res in
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
        
        img.image = UIImage(named: profile?.name ?? "")
        nameProf.text = profile?.name ?? ""
        modelProf.text = "Model: \(profile?.model! ?? "")"
        manu.text = "Manufacturer: \(profile?.manufacturer! ?? "")"
        cost.text = "Cost: \(profile?.cost_in_credits! ?? "")"
        lenght.text = "Lenght: \(profile?.length! ?? "")"
        max.text = "Speed: \(profile?.max_atmosphering_speed! ?? "")"
        pass.text = "Passengers: \(profile?.passengers! ?? "")"
        cargo.text = "Capacity: \(profile?.cargo_capacity! ?? "")"
        
        if let image = UIImage(named: profile!.name!) {
            // La imagen se cargó correctamente
        } else {
            // El nombre de la imagen es incorrecto o la imagen no existe
            img.image = UIImage(systemName: "person.circle" )
        }
    }


}
