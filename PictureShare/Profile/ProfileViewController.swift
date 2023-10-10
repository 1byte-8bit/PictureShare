//
//  ProfileViewController.swift
//  PictureShare
//
//  Created by Alexandr on 03.09.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileImageView = UIImageView()
    private let nameLabel = UILabel()
    private let loginNameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {         
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1333333333, alpha: 1)
        
        setupProfileImage()
        view.addSubview(profileImageView)
        
        setupNameLabel()
        view.addSubview(nameLabel)
        
        setupLoginNameLabel()
        view.addSubview(loginNameLabel)
        
        setupDescriptionLabel()
        view.addSubview(descriptionLabel)
        
        setupLogoutButton()
        view.addSubview(logoutButton)
        
        setConstraints()
    }
    
    private func setupProfileImage() {
        let profileImage = UIImage(named: "Photo") ?? UIImage()
        
        profileImageView.image = profileImage
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupNameLabel() {
        nameLabel.text = "Екатерина Новикова"
        nameLabel.font = nameLabel.font.withSize(23)
        nameLabel.textColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLoginNameLabel() {
        loginNameLabel.text = "@ekaterina_nov"
        loginNameLabel.font = loginNameLabel.font.withSize(13)
        loginNameLabel.textColor = #colorLiteral(red: 0.6823529412, green: 0.6862745098, blue: 0.7058823529, alpha: 1)
        
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupDescriptionLabel() {
        descriptionLabel.text = "Hello, world!"
        descriptionLabel.font = descriptionLabel.font.withSize(13)
        descriptionLabel.textColor = .white
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLogoutButton() {
        let buttonImage = UIImage(named: "logout") ?? UIImage()
        
        logoutButton.setImage(buttonImage, for: .normal)
        logoutButton.imageEdgeInsets = UIEdgeInsets(
            top: 11,
            left: 16,
            bottom: 11,
            right: 6
        )
        logoutButton.addTarget(
            self,
            action: #selector(Self.didTapLogoutButton),
            for: .touchUpInside
        )
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @objc private func didTapLogoutButton() {
        print("Exit")
    }
    
}

// MARK: Set constraints

extension ProfileViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
                profileImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                profileImageView.widthAnchor.constraint(equalToConstant: 70),
                profileImageView.heightAnchor.constraint(equalToConstant: 70),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                nameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 8),
                nameLabel.leadingAnchor.constraint(equalTo: profileImageView.leadingAnchor),
                nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                loginNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
                loginNameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
                loginNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                descriptionLabel.topAnchor.constraint(equalTo: loginNameLabel.bottomAnchor, constant: 8),
                descriptionLabel.leadingAnchor.constraint(equalTo: loginNameLabel.leadingAnchor),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            ]
        )
        
        NSLayoutConstraint.activate(
            [
                logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                logoutButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
                logoutButton.widthAnchor.constraint(equalToConstant: 44),
                logoutButton.heightAnchor.constraint(equalToConstant: 44),
            ]
        )
    }
}
