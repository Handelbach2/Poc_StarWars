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
    
    func getCharacters(success: @escaping (_ json: CharBody)->(), failure: @escaping(_ error: Error?)->()) {
        
        
        let url = "https://swapi.py4e.com/api/people/"
        
//        func updateAnswerService(idQuestion:String, idAnswer: String, value: String, idCourse: String, success: @escaping (_ json: updateAnswerContent)->(), failure: @escaping(_ error: Error?)->()){
//
//            let upAns = updateAnswerInput(
//                idQuestion: idQuestion,
//                idAnswer: idAnswer,
//                newAnswer: value,
//                idCourse: idCourse,
//                idUser: Globals.shared.idUser
//            )
//
//            let headers: HTTPHeaders = [ "x-access-token": token ]
//            let newUrl = url+"courses/updateAnswer"
//
//            AF.request(newUrl, method: .post, parameters: upAns, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: statusOK).responseDecodable(of: updateAnswerResp.self) { res in
//                LoadingIndicatorView.hide()
//
//                switch res.result {
//                case .success(let resp) :
//                    let user = resp.data.updatAnswer
//                    success(user)
//                case .failure(let error) :
//                    failure(error)
//                }
//            }
//        }
        
        
        AF.request(url, method: .get).validate(statusCode: statusOK).responseDecodable(of: CharBody.self) { res in
            print("Personajes: ", res)
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
