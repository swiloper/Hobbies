//
//  ViewController.swift
//  Hobbies
//
//  Created by myronishyn.ihor on 24.03.2022.
//

import UIKit

final class HobbiesViewController: UIViewController {
    @IBOutlet weak var hobbiesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hobbiesCollectionView.delegate = self
        hobbiesCollectionView.dataSource = self
        let layout = CustomLayout()
        layout.estimatedItemSize = CGSize(width: 150, height: 50)
        hobbiesCollectionView.collectionViewLayout = layout
    }
}

extension HobbiesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HobbiesData.hobbies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let hobbyCell = hobbiesCollectionView.dequeueReusableCell(withReuseIdentifier: "HobbyCell", for: indexPath) as! HobbyCell
        hobbyCell.setupHobbyCell(hobby: HobbiesData.hobbies[indexPath.row])
        return hobbyCell
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let hobbyCell = hobbiesCollectionView.cellForItem(at: indexPath) as! HobbyCell
        HobbiesData.hobbies[indexPath.item].isSelected = hobbyCell.hobbyTitleLabel.textColor == .systemBlue ? true : false
        collectionView.reloadData()
    }
}
