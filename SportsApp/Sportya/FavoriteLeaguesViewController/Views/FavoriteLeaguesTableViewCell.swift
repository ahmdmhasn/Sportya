//
//  FavoriteLeaguesTableViewCell.swift
//  SportsApp
//
//  Created by Macbook on 26/03/2021.
//

import UIKit

class FavoriteLeaguesTableViewCell: UITableViewCell {
    @IBOutlet weak var favoriteLeagueNameImageView: UIImageView!
    
    @IBOutlet weak var favoriteLeagueNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func showFavoriteLeagueChannel(_ sender: Any) {
    }
}
