//
//  SportsViewModel.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 24/03/2021.
//

import Foundation

protocol SportsProtocol {
    func callFuncToGetAllSports()
    var getSports: ((SportsProtocol)->Void)? {get set}
    var sportData: Sport? {get set}
}

class SportsViewModel: SportsProtocol {
    
    
    private let apiService = APIClient()
    
    var getSports: ((SportsProtocol) -> Void)?
    
    var sportData: Sport? {
        didSet {
            getSports!(self)
        }
    }
    
    func callFuncToGetAllSports() {
        apiService.getSportsFromAPI(endPoint:"/v1/json/1/all_sports.php") {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let data):
                print(data)
                do {
                    let decoder = JSONDecoder()
                    let decodedObject = try decoder.decode(Sport.self, from: data as! Data)
                    self?.sportData = decodedObject
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
