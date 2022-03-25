//
//  HobbyCell.swift
//  Hobbies
//
//  Created by myronishyn.ihor on 25.03.2022.
//

import UIKit

class HobbyCell: UICollectionViewCell {
    @IBOutlet weak var hobbyTitleLabel: UILabel!
    
    func setupHobbyCell(hobby: Hobby) {
        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = contentView.frame.height / 2
        hobbyTitleLabel.text = hobby.title
        if hobby.isSelected {
            contentView.backgroundColor = .systemBlue
            hobbyTitleLabel.textColor = .white
        } else {
            contentView.backgroundColor = .white
            hobbyTitleLabel.textColor = .systemBlue
        }
    }
}
