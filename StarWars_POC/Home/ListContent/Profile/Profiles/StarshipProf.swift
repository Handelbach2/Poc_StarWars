//
//  StarshipProf.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class StarshipProf: UIViewController {
    
    @IBOutlet weak var viewProd: UIView!
    @IBOutlet weak var nameProf: UILabel!
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var manu: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var lenght: UILabel!
    @IBOutlet weak var max: UILabel!
    @IBOutlet weak var crew: UILabel!
    @IBOutlet weak var pass: UILabel!
    
    var url: String?
    var profile: StarshipStruct?
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
    }
    
    func getProfile() {
        API.shared.getProfileStarship(url: self.url!) { res in
            self.profile = res
            self.viewConfig()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func viewConfig() {
        viewProd.layer.cornerRadius = 10
        viewProd.layer.borderWidth = 1
        viewProd.layer.borderColor = UIColor.yellow.cgColor
        
        nameProf.text = profile?.name! ?? ""
        model.text = "Model: \(profile?.model! ?? "")"
        manu.text = "Manufacturer: \(profile?.manufacturer! ?? "")"
        cost.text = "Cost: \(profile?.cost_in_credits! ?? "")"
        lenght.text = "Lenght: \(profile?.length! ?? "")"
        max.text = "Speed: \(profile?.max_atmosphering_speed! ?? "")"
        crew.text = "Crew: \(profile?.crew! ?? "")"
        pass.text = "Passengers: \(profile?.passengers! ?? "")"
    }

}
