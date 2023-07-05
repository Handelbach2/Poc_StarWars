//
//  VehicleStruct.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 05/07/23.
//

import Foundation

struct VehicleStruct : Codable {
    var name: String?
    var model: String?
    var manufacturer: String?
    var cost_in_credits: String?
    var length: String?
    var max_atmosphering_speed: String?
    var crew: String?
    var passengers: String?
    var cargo_capacity: String?
    var consumables: String?
    var vehicle_class: String?
    var pilots: [String]?
    var films: [String]?
    var created: String?
    var edited: String?
    var url: String?
}
