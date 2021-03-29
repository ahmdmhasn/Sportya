//
//  LatestEventsViewModel.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 28/03/2021.
//

import Foundation

protocol LatestEventsProtocol {
    
    init(league: AllLeagueInfo)
    func callFuncToGetLatestEvents(leagueId: String)
    var getLatestEvents: ((LatestEventsProtocol) -> Void)? {get}
    var latestEventsData: LatestEvents? {get set}
    var selectedLeague: AllLeagueInfo? {get set}
    var twoTeams: [[Team]]? {get set}
}



class LatestEventsViewModel: LatestEventsProtocol {
    
    var twoTeams: [[Team]]?
    
    required init(league: AllLeagueInfo) {
        self.selectedLeague = league
        
    }
    var apiService = APIClient()
    
    func callFuncToGetLatestEvents(leagueId: String) {
        
        apiService.fetchData(endPoint: "eventspastleague.php?id=\(leagueId)", responseClass: LatestEvents.self) {[weak self] (response) in
            switch response {
            case .success(let latestEvents):
                self?.latestEventsData = latestEvents
//                print(latestEvents)
                
            
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
    
    var getLatestEvents: ((LatestEventsProtocol) -> Void)?
    
    var latestEventsData: LatestEvents? {
        didSet {
            getLatestEvents!(self)
        }
    }
    
    var selectedLeague: AllLeagueInfo?
    
    func getTeamsForLatestMatches(teams: Teams) {
        twoTeams = []
        for item in (latestEventsData?.events)! {
            twoTeams?.append([teams.teams.filter({$0.teamId == item.homeTeamId})[0],
                              teams.teams.filter({$0.teamId == item.awayTeamId})[0]
                             ])
            print(twoTeams)
        }
    }
}
