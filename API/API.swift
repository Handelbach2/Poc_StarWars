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
}
