//
//  SportsViewController.swift
//  SportsApp
//
//  Created by Mahmoud Morsy on 19/03/2021.
//

import UIKit

class SportsViewController: UIViewController {


    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.register(UINib(nibName: "SportsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: String(describing: SportsCollectionViewCell.self))
        
    }
    

}


extension SportsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SportsCollectionViewCell.self), for: indexPath) as? SportsCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.size.width - 30) / 2
        return CGSize(width: size, height: size)
    }
}
