//
//  ImagesListCell.swift
//  PictureShare
//
//  Created by Alexandr on 09.08.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {
    
    static let reuseIdentifier = "ImagesListCell"
    
    @IBOutlet private weak var cellImage: UIImageView!
    @IBOutlet private weak var likeButton: UIButton!
    @IBOutlet private weak var dateLabel: UILabel!
    
    func setCellData(image: UIImage,
                     likeButtonImage: UIImage?,
                     dateLabelText: String) {
        cellImage.image = image
        likeButton.setImage(likeButtonImage, for: .normal)
        dateLabel.text = dateLabelText
    }
}
