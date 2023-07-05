//
//  PLanetStruct.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import Foundation


struct planetBody : Codable {
    var name: String?
    var rotation_period: String?
    var orbital_period: String?
    var diameter: String?
    var climate: String?
    var gravity: String?
    var terrain: String?
    var surface_water: String?
    var population: String?
    var residents: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
}
