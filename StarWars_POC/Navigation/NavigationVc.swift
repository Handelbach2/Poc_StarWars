//
//  NavigationVc.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit

extension UIViewController {

    func ListView(url: String, _ isFilm: Bool, section: String) {
        let sb = UIStoryboard(name: "ListSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "listVC") as! ListVC
        vc.url = url
        vc.isFilm = isFilm
        vc.section = section
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func profile(url: String) {
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "profileVC") as! ProfileVC
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func profilePlanets(url: String) {
        print("planets ulr: ", url)
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "planetsVc") as! PlanetsProf
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func profileFilm(url: String) {
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "filmVc") as! FilmProf
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func speciesFilm(url: String) {
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "speciesVc") as! SpeciesProf
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func vehiclesFilm(url: String) {
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "vehiclesVc") as! VehiclesProf
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func starshipFilm(url: String) {
        let sb = UIStoryboard(name: "ProfileSB", bundle: nil)
        let vc = sb.instantiateViewController(identifier: "starshipVc") as! StarshipProf
        vc.url = url
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
