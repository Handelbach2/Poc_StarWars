//
//  FilmsStruct.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 04/07/23.
//

import Foundation

struct FilmBody: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [FilmResutlStruct]?
}

struct FilmResutlStruct: Codable {
    var title: String?
    var episode_id: Int?
    var opening_crawl: String?
    var director: String?
    var producer: String?
    var release_date: String?
    var characters: [String]?
    var planets: [String]?
    var starships: [String]?
    var vehicles: [String]?
    var species: [String]?
    var created: String?
    var edited: String?
    var url: String?
}
