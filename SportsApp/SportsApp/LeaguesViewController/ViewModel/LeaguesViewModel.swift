//
//  LeaguesViewModel.swift
//  SportsApp
//
//  Created by Macbook on 25/03/2021.
//

import Foundation
protocol LeaguesProtocol {
    func callFuncToGetAllLeagues()
    func callFuncToGetLeaguesInfo(leagueId:String)
    var getLeagues: ((LeaguesProtocol)->Void)? {get set}
    var getLeaguesInfo: ((LeaguesProtocol)->Void)? {get set}
    var leagueData: League? {get set}//array of leagues
    var leagueInformtions: leagueInfo? {get set}
}

class LeaguesViewModel: LeaguesProtocol {
    
   
    
    var getLeaguesInfo: ((LeaguesProtocol) -> Void)?
    
    var leagueInformtions: leagueInfo? {
        didSet{
            getLeaguesInfo!(self)
        }
    }
    
    var getLeagues: ((LeaguesProtocol) -> Void)?
    
    var leagueData: League? {
        didSet {
                getLeagues!(self)
              }
    }
   
    private let apiService = APIClient()
    
    
    func callFuncToGetAllLeagues() {
    
        apiService.getSportsFromAPI(endPoint:"/v1/json/1/all_leagues.php") {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
               // print(data)
                do {
                    let decoder = JSONDecoder()
                    let decodedObject = try decoder.decode(League.self, from: data as! Data)
                    self?.leagueData = decodedObject
                 //   print(decodedObject)
                    
                }catch {
                    print(error.localizedDescription)
                }
            case .none:
                break
            }
        }
    }
    
    
    func callFuncToGetLeaguesInfo(leagueId:String) {
        apiService.getSportsFromAPI(endPoint:"/v1/json/1/lookupleague.php?id=\(leagueId)") {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                print(data)
                do {
                    let decoder = JSONDecoder()
                    let decodedObject = try decoder.decode(leagueInfo.self, from: data as! Data)
                    self?.leagueInformtions = decodedObject
                    print(decodedObject)
                    
                }catch {
                    print(error.localizedDescription)
                }
            case .none:
                break
            }
        }
    }
    
}
