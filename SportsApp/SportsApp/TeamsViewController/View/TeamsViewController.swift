//
//  TeamsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 23/03/2021.
//

import UIKit
import SDWebImage
import KRProgressHUD

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
    
    @IBOutlet weak var backGroundImage: UIImageView!
    var teamsViewModel: TeamsViewModel? {
        didSet {
            teamsViewModel?.callFuncToGetTeamDetail(teamId: (teamsViewModel?.selectedTeam?.teamId)!, completionHandler: {(isFinished) in
                if !isFinished {
                    KRProgressHUD.show()
                } else {
                       KRProgressHUD.dismiss()
                }
            })
            
            teamsViewModel?.getTeamDetail = {[weak self] vm in
                
                self?.teamNameLabel.text = self?.teamsViewModel?.selectedTeam?.teamName
                self?.leagueName.text = self?.teamsViewModel?.selectedTeam?.league
                self?.countryNameLabel.text = self?.teamsViewModel?.selectedTeam?.country
                self?.foundedYearLabel.text = self?.teamsViewModel?.selectedTeam?.birthYear
                self?.stadiumNameLabel.text = self?.teamsViewModel?.selectedTeam?.stadiumName
                self?.descriptionLabel.text = self?.teamsViewModel?.selectedTeam?.description
                
                if let image = self?.teamsViewModel?.selectedTeam?.stadiumImgURL {
                    self?.stadiumImagView.sd_setImage(with: URL(string: (image)), placeholderImage: UIImage(named: "sports"))
                }
                if let image = self?.teamsViewModel?.selectedTeam?.imgURL {
                    self?.teamLogoImageView.sd_setImage(with: URL(string: (image)), placeholderImage: UIImage(named: "sports"))
                }
                
                if let image = self?.teamsViewModel?.selectedTeam?.teamBanner {
                    self?.backGroundImage.sd_setImage(with: URL(string: (image)), placeholderImage: UIImage(named: "sports"))
                }
                
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = teamsViewModel?.selectedTeam?.teamName

        
    }
}
