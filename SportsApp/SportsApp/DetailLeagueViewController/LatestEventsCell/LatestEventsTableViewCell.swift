//
//  LatestEventsTableViewCell.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 23/03/2021.
//

import UIKit

class LatestEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var latestEventCollectionView: UICollectionView! {
        didSet {
            latestEventCollectionView.delegate = self
            latestEventCollectionView.dataSource = self
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

extension LatestEventsTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = latestEventCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: LatestEventsCollectionViewCell.self) , for: indexPath) as? LatestEventsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 2
        cell.contentView.layer.borderColor = UIColor.gray.cgColor
        
        
        
        return cell
    }
}
