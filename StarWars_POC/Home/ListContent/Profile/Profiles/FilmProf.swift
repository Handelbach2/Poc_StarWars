//
//  FilmProf.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import UIKit

class FilmProf: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var viewFilm: UIView!
    @IBOutlet weak var titleFilm: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var opening: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var producer: UILabel!
    @IBOutlet weak var releaseFilm: UILabel!
    
    var url: String?
    var profile: FilmResutlStruct?
    
    
    override func viewWillAppear(_ animated: Bool) {
        generateStars()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getProfile()
        // Do any additional setup after loading the view.
    }
    
    func getProfile() {
        API.shared.getProfileFilm(url: self.url!) { res in
            self.profile = res
            self.viewConfig()
        } failure: { error in
            self.simpleErrorAlert(msg:"Se ha perdido la conexión con el servidor, inténtelo más tarde.")
        }
    }
    
    func viewConfig() {
        viewFilm.layer.cornerRadius = 10
        viewFilm.layer.borderWidth = 1
        viewFilm.layer.borderColor = UIColor.yellow.cgColor
        img.image = UIImage(named: profile!.title!)
        titleFilm.text = profile?.title!
        episode.text = "Episode: \(profile?.episode_id! ?? 0)"
        opening.text = "Opening: \(profile?.opening_crawl! ?? "")"
        director.text = "Director: \(profile?.director! ?? "")"
        producer.text = "Producer: \(profile?.producer! ?? "")"
        releaseFilm.text = "Release: \(profile?.release_date! ?? "")"
        
        if let image = UIImage(named: profile!.title!) {
            // La imagen se cargó correctamente
        } else {
            // El nombre de la imagen es incorrecto o la imagen no existe
            img.image = UIImage(systemName: "person.circle" )
        }
    }

}
