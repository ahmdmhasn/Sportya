//
//  AllTeamsInLeagueViewModel.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 28/03/2021.
//

import Foundation

protocol AllTeamsInLeagueProtocol {
    init(league: AllLeagueInfo)
    func callAllTeamsInLeague(leagueId: String)
    var getAllTeamsInLeagueData: ((AllTeamsInLeagueProtocol) -> Void)? {get}
    var teamDetailData: Teams? {get set}
    var selectedLeague: AllLeagueInfo? {get set}
}

class AllTeamsInLeagueViewModel: AllTeamsInLeagueProtocol {
    
    
    required init(league: AllLeagueInfo) {
        self.selectedLeague = league
    }
    
    let apiService = APIClient()
    
    func callAllTeamsInLeague(leagueId: String) {
        apiService.fetchData(endPoint: "lookup_all_teams.php?id=\(leagueId)", responseClass: Teams.self) {[weak self] (response) in
            switch response {
            case .success(let allLeagueTeams):
                self?.teamDetailData = allLeagueTeams
//                print(allLeagueTeams)
                
            
//                self.sportsView?.fetchingDataSuccess()
//                self.sportsView?.hideIndicator()
            case .failure(let error):
                let errorMessage = error.userInfo[NSLocalizedDescriptionKey]! as! String
                print(error)
                if error.code == -1 {
//                    self.sportsView?.showInternetMessage(message: errorMessage)
                }else{
//                    self.sportsView?.showError(error: errorMessage)
                }
            }
        }
    }
    
    var getAllTeamsInLeagueData: ((AllTeamsInLeagueProtocol) -> Void)?
    
    var teamDetailData: Teams? {
        didSet {
            getAllTeamsInLeagueData!(self)
        }
    }
    var selectedLeague: AllLeagueInfo?

    
}

