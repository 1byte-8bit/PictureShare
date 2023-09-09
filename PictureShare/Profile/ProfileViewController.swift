//
//  ProfileViewController.swift
//  PictureShare
//
//  Created by Alexandr on 03.09.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    @IBOutlet private weak var profileImage: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    @IBOutlet private weak var loginNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var logoutButton: UIButton!
    
    @IBAction private func didTapLogoutButton(_ sender: UIButton) {
    }
    
}
