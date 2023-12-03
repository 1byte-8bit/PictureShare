//
//  ProfileViewController.swift
//  PictureShare
//
//  Created by Alexandr on 03.09.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let profileImage = UIImage(named: "Photo") ?? UIImage()
        imageView.image = profileImage
        
        return imageView
    }()
    
    private let nameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Екатерина Новикова"
        label.font = label.font.withSize(23)
        label.textColor = .white
        
        return label
    }()
    
    private let loginNameLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "@ekaterina_nov"
        label.font = label.font.withSize(13)
        label.textColor = #colorLiteral(red: 0.6823529412, green: 0.6862745098, blue: 0.7058823529, alpha: 1)

        return label
    }()
    
    private let descriptionLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, world!"
        label.font = label.font.withSize(13)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var logoutButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonImage = UIImage(named: "logout") ?? UIImage()
        
        button.setImage(buttonImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(
            top: 11,
            left: 16,
            bottom: 11,
            right: 6
        )
        button.addTarget(
            self,
            action: #selector(Self.didTapLogoutButton),
            for: .touchUpInside
        )

        return button
    }()
    
    override func viewDidLoad() {         
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.1058823529, blue: 0.1333333333, alpha: 1)
        addSubViews()
        applyConstraints()
    }
    
    private func addSubViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(loginNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(logoutButton)
    }
    
    @objc private func didTapLogoutButton() {
        print("Exit")
    }
}

// MARK: applyConstraints

extension ProfileViewController {
    private func applyConstraints() {
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
