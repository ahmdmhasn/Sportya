//
//  DetailLeagueViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 19/03/2021.
//

import UIKit
import SDWebImage
import KRProgressHUD

class DetailLeagueViewController: UIViewController {

    @IBOutlet var detailLeagueTableView: UITableView! {
        didSet {
            detailLeagueTableView.delegate = self
            detailLeagueTableView.dataSource = self
        }
    }
    
    
    var latestViewModel: LatestEventsViewModel? {
        didSet {
            KRProgressHUD.show()
            latestViewModel?.callFuncToGetLatestEvents(leagueId: (latestViewModel?.selectedLeague!.leagueId)!)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
               KRProgressHUD.dismiss()
            }

            latestViewModel?.getLatestEvents = {[weak self] viewModel in
                DispatchQueue.main.async {
                    self?.detailLeagueTableView.reloadData()
                }
            }
        }
    }
    
    var allTeamsInLeagueViewModel: AllTeamsInLeagueViewModel? {
        didSet {
            
            allTeamsInLeagueViewModel?.callAllTeamsInLeague(leagueId: (allTeamsInLeagueViewModel?.selectedLeague!.leagueId)!)
            
            allTeamsInLeagueViewModel?.getAllTeamsInLeagueData = {[weak self] viewModel in
                DispatchQueue.main.async {
                    self?.detailLeagueTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
}


extension DetailLeagueViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: IntroImageTableViewCell.self)) as? IntroImageTableViewCell else {
                return UITableViewCell()
            }
            if let image = self.latestViewModel?.selectedLeague?.leagueImg {
                cell.introImageView.sd_setImage(with: URL(string: (image)), placeholderImage: UIImage(named: "sports"))
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UpComingEventsTableViewCell.self)) as? UpComingEventsTableViewCell else {
                return UITableViewCell()
            }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LatestEventsTableViewCell.self)) as? LatestEventsTableViewCell else {
                return UITableViewCell()
            }
            cell.latestViewModel = self.latestViewModel
            
            return cell
        case 3:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TeamsTableViewCell.self)) as? TeamsTableViewCell else {
                return UITableViewCell()
            }
            cell.allTeamsInLeague = self.allTeamsInLeagueViewModel
            cell.delegate = self
            
            return cell
            
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 350
        case 2:
            return 250
        case 3:
            return 200
        default:
            return 100
        }
    }
    
    
}

extension DetailLeagueViewController: CollectionCellDelegate {
    
    func selectedItem(team: Team) {
        
        guard let teamDetailsViewController = self.storyboard?.instantiateViewController(identifier: String(describing: TeamDetailsViewController.self)) as? TeamDetailsViewController else {
            return
        }
        
        teamDetailsViewController.teamsViewModel = self.allTeamsInLeagueViewModel?.getSelectedTeam(team: team)
        

        self.navigationController?.pushViewController(teamDetailsViewController, animated: true)
    }
    
    
}

