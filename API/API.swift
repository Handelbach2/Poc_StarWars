//
//  API.swift
//  StarWars_POC
//
//  Created by Fabian Labra on 03/07/23.
//

import UIKit
import Alamofire

class API {
    
    static let shared = API()
    
    let statusOK = 200...299
    
    func getCharacters(url: String, success: @escaping (_ json: CharBody)->(), failure: @escaping(_ error: Error?)->()) {
                        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: CharBody.self) { res in
            
            print()
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getFilms(url: String, success: @escaping (_ json: FilmBody)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: FilmBody.self) { res in
            
            print("films: ", res.result)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func changePage(url: String, success: @escaping (_ json: CharBody)->(), failure: @escaping(_ error: Error?)->()) {
        
        let url = url
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: CharBody.self) { res in
            
            print()
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfileChar(url: String, success: @escaping (_ json: ResultsCharStruct)->(), failure: @escaping(_ error: Error?)->()) {
        
        
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: ResultsCharStruct.self) { res in
            
            print("profile: ", res)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfilePlanet(url: String, success: @escaping (_ json: planetBody)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: planetBody.self) { res in
            print("plnets: ", res)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfileFilm(url: String, success: @escaping (_ json: FilmResutlStruct)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: FilmResutlStruct.self) { res in
            print("film: ", res)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfileSpecies(url: String, success: @escaping (_ json: SpeciesStruct)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: SpeciesStruct.self) { res in
            print("film: ", res)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfileVehicle(url: String, success: @escaping (_ json: VehicleStruct)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: VehicleStruct.self) { res in
            print("film: ", res)
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
    
    func getProfileStarship(url: String, success: @escaping (_ json: StarshipStruct)->(), failure: @escaping(_ error: Error?)->()) {
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: StarshipStruct.self) { res in
            print("film: ", res)            
            switch res.result {
            case .success(let resp) :
                let user = resp
                success(user)
            case .failure(let error) :
                failure(error)
            }
        }
    }
}
