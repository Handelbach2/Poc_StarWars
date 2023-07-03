//
//  CharacterStruct.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import Foundation


struct CharBody : Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ResultsCharStruct]
}

struct ResultsCharStruct : Codable {
    var name: String?
    var height: String?
    var mass: String?
    var hair_color: String?
    var skin_color: String?
    var eye_color: String?
    var birth_year: String?
    var gender: String?
    var homeworld: String?
    var films: [String]?
    var species: [String]?
    var vehicles: [String]?
    var starships: [String]?
    var created: String?
    var edited: String?
    var url: String?
}
