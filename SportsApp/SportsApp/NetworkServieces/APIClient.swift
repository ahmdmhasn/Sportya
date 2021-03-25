//
//  APIClient.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 24/03/2021.
//

import Foundation
import Alamofire

class APIClient {
    fileprivate var baseURL = "https://thesportsdb.com/api"
   
    func getSportsFromAPI(endPoint: String,completion:@escaping ((Result< Any,Error>)?) -> Void) {
        let urlString = baseURL + endPoint
        AF.request(urlString).response { (response) in
            guard let data = response.value , response.error == nil else {
                completion(.failure(response.error!))
                return
            }

            completion(.success(data!))
        }
        
//        AF.request(urlString,parameters: nil,headers: nil).validate()
//            .responseDecodable(of: Sport.self) { (response) in
//                guard let sports = response.value else { return }
//                print(sports)
//            }
        
    }
    
//
//    func getLeaguesFromAPI(endPoint: String,completion:@escaping ((Result< Any,Error>)?) -> Void) {
//        let urlString = baseURL + endPoint
//        AF.request(urlString).response { (response) in
//            guard let data = response.value , response.error == nil else {
//                completion(.failure(response.error!))
//                return
//            }
//
//            completion(.success(data!))
//        }
//
//
//    }
//
//    func getLeaguesInfoFromAPI(leagueId: String,completion:@escaping ((Result< Any,Error>)?) -> Void) {
//        let url="https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id="
//        let urlString=url + leagueId
//        AF.request(urlString).response { (response) in
//            guard let data = response.value , response.error == nil else {
//                completion(.failure(response.error!))
//                return
//            }
//
//            completion(.success(data!))
//        }
//
//
//    }
//
    
}
