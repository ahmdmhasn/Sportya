//
//  UpComingEventsTableViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 22/03/2021.
//

import UIKit

class UpComingEventsTableViewCell: UITableViewCell {
    
    @IBOutlet var upComingCollectionView: UICollectionView!{
        didSet {
            upComingCollectionView.delegate = self
            upComingCollectionView.dataSource = self
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

extension UpComingEventsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = upComingCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: UpComingCollectionViewCell.self) , for: indexPath) as? UpComingCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        
        
        
        return cell
    }
    
    
}
