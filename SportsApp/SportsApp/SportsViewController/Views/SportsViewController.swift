//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 19/03/2021.
//

import UIKit
import Alamofire
import SDWebImage

class SportsViewController: UIViewController {
    

    @IBOutlet weak var sportsCollectionView: UICollectionView! {
        didSet {
            sportsCollectionView.delegate = self
            sportsCollectionView.dataSource = self
            sportsCollectionView.register(UINib(nibName: "SportsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: SportsCollectionViewCell.self))
        }
    }
    
    var sportsViewModel: SportsViewModel? {
        didSet {
            sportsViewModel?.callFuncToGetAllSports()
            sportsViewModel?.getSports = {[weak self] vm in
                DispatchQueue.main.async {
                    self?.sportsCollectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsViewModel = SportsViewModel()

    }
}


extension SportsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsViewModel?.sportData?.sports.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SportsCollectionViewCell.self), for: indexPath) as? SportsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.sportName.text = sportsViewModel?.sportData?.sports[indexPath.row].sportName
        cell.sportImage.sd_setImage(with: URL(string: (sportsViewModel?.sportData?.sports[indexPath.row].sportImage)!), placeholderImage: UIImage(named: "sports"))
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let leaguesViewController = self.storyboard?.instantiateViewController(identifier: String(describing: LeaguesTableViewController.self)) as? LeaguesTableViewController else {
            return
        }
        self.navigationController?.pushViewController(leaguesViewController, animated: true)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.size.width - 30) / 2
        return CGSize(width: size, height: size)
    }
}

