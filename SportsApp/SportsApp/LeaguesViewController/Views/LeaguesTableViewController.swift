//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Macbook on 19/03/2021.
//

import UIKit
import SDWebImage
import KRProgressHUD

class LeaguesTableViewController: UITableViewController {
   
    var leaguesViewModel: LeaguesViewModel? {
        didSet {
            KRProgressHUD.show()
            leaguesViewModel?.callFuncToGetAllLeagues()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               KRProgressHUD.dismiss()
            }
            
            leaguesViewModel?.getLeagues = {[weak self] viewModel in
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
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesViewModel?.moreInfoArray?.leagues.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        // Configure the cell...
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LeaguesTableViewCell.self), for: indexPath) as? LeaguesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.leagueNameLabel.text = leaguesViewModel?.moreInfoArray?.leagues[indexPath.row].leagueName
        
        if let image = self.leaguesViewModel?.moreInfoArray?.leagues[indexPath.row].leagueImg {
            cell.leagueImageView.sd_setImage(with: URL(string: (image)), placeholderImage: UIImage(named: "sports"))
        }
        
        //make pic circular
        cell.leagueImageView.layer.borderWidth = 1.0
        cell.leagueImageView.layer.masksToBounds = false
        cell.leagueImageView.layer.borderColor = UIColor.black.cgColor
        cell.leagueImageView.layer.cornerRadius = cell.leagueImageView.frame.size.width/2
        cell.leagueImageView.clipsToBounds=true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailLeagueViewController = self.storyboard?.instantiateViewController(identifier: String(describing: DetailLeagueViewController.self)) as? DetailLeagueViewController else {
            return
        }
        

        detailLeagueViewController.latestViewModel = self.leaguesViewModel?.getMatchesViewModel(league: (leaguesViewModel?.moreInfoArray?.leagues[indexPath.row])!)
        
        detailLeagueViewController.allTeamsInLeagueViewModel = self.leaguesViewModel?.getAllTeamsInLeagueViewModel(league: (leaguesViewModel?.moreInfoArray?.leagues[indexPath.row])!)
        
        
        
        

        self.navigationController?.pushViewController(detailLeagueViewController, animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
