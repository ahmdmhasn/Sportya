//
//  TeamsViewModel.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 28/03/2021.
//

import Foundation

protocol TeamsProtocol {
    
    init(team: Team)
    func callFuncToGetTeamDetail(teamId: String)
    var getTeamDetail: ((TeamsProtocol) -> Void)? {get}
    var teamDetailData: Teams? {get set}
    var selectedTeam: Team? {get set}
}

class TeamsViewModel: TeamsProtocol {
    required init(team: Team) {
        self.selectedTeam = team
    }
    let apiService = APIClient()
    
    func callFuncToGetTeamDetail(teamId: String) {
        apiService.fetchData(endPoint: "lookupteam.php?id=\(teamId)", responseClass: Teams.self) {[weak self] (response) in
            switch response {
            case .success(let teamDetail):
                self?.teamDetailData = teamDetail
//                print(teamDetail)
                
            
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
    
    var getTeamDetail: ((TeamsProtocol) -> Void)?
    
    var teamDetailData: Teams? {
        didSet {
            getTeamDetail!(self)
        }
    }
    
    var selectedTeam: Team?
}
