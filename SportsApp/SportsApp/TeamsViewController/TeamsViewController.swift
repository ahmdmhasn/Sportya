//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 23/03/2021.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    @IBOutlet weak var faceBookButton: UIButton!
    @IBOutlet weak var instagramButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stadiumNameLabel: UILabel!
    @IBOutlet weak var foundedYearLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var leagueName: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var stadiumImagView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        teamLogoImageView.image=UIImage(named: "teamLogo")
        stadiumImagView.image=UIImage(named: "studemImg")
       teamNameLabel.text="Arsenal"
        leagueName.text="English Primer League"
        countryNameLabel.text="England"
        foundedYearLabel.text="1892"
        stadiumNameLabel.text="Emiartes stadium"
        
    }
    

}
