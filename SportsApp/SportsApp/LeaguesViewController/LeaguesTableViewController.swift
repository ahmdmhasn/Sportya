//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by Macbook on 19/03/2021.
//

import UIKit

class LeaguesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //add register
        tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: String(describing: LeaguesTableViewCell.self))
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        // Configure the cell...
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: LeaguesTableViewCell.self), for: indexPath) as? LeaguesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.leagueImageView.image=UIImage(named: "PremierLeague2")
        
        //make pic circular
        cell.leagueImageView.layer.borderWidth = 1.0
        cell.leagueImageView.layer.masksToBounds = false
        cell.leagueImageView.layer.borderColor = UIColor.black.cgColor
        cell.leagueImageView.layer.cornerRadius = cell.leagueImageView.frame.size.width/2
        cell.leagueImageView.clipsToBounds=true
        
        cell.leagueNameLabel.text="English League 1"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }



}
