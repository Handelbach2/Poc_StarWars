//
//  SpeciesStruct.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 05/07/23.
//

import Foundation
import UIKit

struct SpeciesStruct : Decodable {
    var name: String?
    var classification: String?
    var designation: String?
    var average_height: String?
    var skin_colors: String?
    var hair_colors: String?
    var eye_colors: String?
    var average_lifespan: String?
    var homeworld: String?
    var language: String?
    var people: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
}
