//
//  League.swift
//  SportsApp
//
//  Created by Macbook on 25/03/2021.
//

import Foundation


struct League :Codable{
    var leagues :[AllLeagues]
}


struct AllLeagues :Codable{
    var leagueId: String
    var  leagueName :String
    var leagueSportType :String
    
    enum CodingKeys: String, CodingKey {
        case leagueId = "idLeague"
        case leagueName = "strLeague"
        case leagueSportType = "strSport"
       
    }
}

struct leagueInfo : Codable{
    var leaguesInfo : [AllLeagueInfo]
}

struct AllLeagueInfo : Codable{
    var leagueImg :String
    var leagueYoutubeUrl :String
    
    enum CodingKeys: String, CodingKey {
        case leagueImg = "strBadge"
        case leagueYoutubeUrl = "strYoutube"
       
    }
}
