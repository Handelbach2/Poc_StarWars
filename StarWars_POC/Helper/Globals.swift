//
//  Utils.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//
import Foundation
import UIKit


class Globals {
    
    static let  shared = Globals()
        
    var sections: [String] = ["Personajes", "Planetas", "Películas", "Razas", "Vehiculos", "Naves"]
    
    var imgs: [UIImage?] = [UIImage(named: "char"), UIImage(named: "planets"), UIImage(named: "mov"),UIImage(named: "specie"),UIImage(named: "vei"),UIImage(named: "ships")]
    
    var desc: [String] = [
        "Explora los fascinantes personajes del universo",
        "Embárcate en un viaje a través de los fascinantes planetas",
        "Descubre la saga épica de Star Wars.",
        "Sumérgete en la rica diversidad de las razas que habitan la galaxia",
        "Explora la impresionante variedad de vehículos.",
        "Embárcate en un viaje a través de las majestuosas naves espaciales",
    ]
}
