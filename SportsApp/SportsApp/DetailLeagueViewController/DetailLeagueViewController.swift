//
//  DetailLeagueViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 19/03/2021.
//

import UIKit

class DetailLeagueViewController: UIViewController {

    @IBOutlet var detailLeagueTableView: UITableView! {
        didSet {
            detailLeagueTableView.delegate = self
            detailLeagueTableView.dataSource = self
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
            return cell
        case 3:
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TeamsTableViewCell.self)) as? TeamsTableViewCell else {
                return UITableViewCell()
            }
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

