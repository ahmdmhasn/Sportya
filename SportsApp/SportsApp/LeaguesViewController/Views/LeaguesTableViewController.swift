//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Macbook on 19/03/2021.
//

import UIKit
import SDWebImage
class LeaguesTableViewController: UITableViewController {

    
    
    var leaguesViewModel: LeaguesViewModel? {
        didSet {
            leaguesViewModel?.callFuncToGetAllLeagues()
           // leaguesViewModel?.callFuncToGetLeaguesInfo(leagueId: "4328")
            leaguesViewModel?.getLeagues = {[weak self] viewModel in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
            leaguesViewModel?.getLeaguesInfo = {[weak self] viewModel in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //add register
        tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: LeaguesTableViewCell.self))
        leaguesViewModel=LeaguesViewModel()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //sportsViewModel?.sportData?.sports.count ?? 0
        return leaguesViewModel?.leagueData?.leagues.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        // Configure the cell...
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LeaguesTableViewCell.self), for: indexPath) as? LeaguesTableViewCell else {
            return UITableViewCell()
        }
        
        let leagueId =  leaguesViewModel?.leagueData?.leagues[indexPath.row].leagueId ?? ""
        leaguesViewModel?.callFuncToGetLeaguesInfo(leagueId: leagueId)
        
     //cell.leagueImageView.image=UIImage(named: "PremierLeague2")
        cell.leagueImageView.sd_setImage(with: URL(string: (leaguesViewModel?.leagueInformtions?.leaguesInfo[0].leagueImg)!), placeholderImage: UIImage(named: "PremierLeague2"))
        //make pic circular
        cell.leagueImageView.layer.borderWidth = 1.0
        cell.leagueImageView.layer.masksToBounds = false
        cell.leagueImageView.layer.borderColor = UIColor.black.cgColor
        cell.leagueImageView.layer.cornerRadius = cell.leagueImageView.frame.size.width/2
        cell.leagueImageView.clipsToBounds=true
        
       // cell.leagueNameLabel.text="English League 1"
        cell.leagueNameLabel.text=leaguesViewModel?.leagueData?.leagues[indexPath.row].leagueName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }



}
