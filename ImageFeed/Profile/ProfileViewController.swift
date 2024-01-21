//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 17.01.2024.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    private var avatarView: UIImageView?
    private var nameLabel: UILabel?
    private var loginLabel: UILabel?
    private var descriptionLabel: UILabel?
    private var exitButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AvatarView()
        NameLabel()
        LoginLabel()
        DescriptionLabel()
        ExitButton()
    }
    
    private func AvatarView() {
        let avatarView = UIImageView(image: UIImage(named: "avatar"))
        avatarView.layer.cornerRadius = 35
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarView)
        avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.avatarView = avatarView
    }
        
    private func NameLabel() {
        let nameLabel = UILabel()
        nameLabel.text = "Имя Фамилия"
        nameLabel.textColor = UIColor(named: "YP White")
        nameLabel.font = .boldSystemFont(ofSize: 23)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.avatarView!.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarView!.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.nameLabel = nameLabel
    }
        
    private func LoginLabel() {
        let loginLabel = UILabel()
        loginLabel.text = "@user_login"
        loginLabel.textColor = UIColor(named: "YP Gray")
        loginLabel.font = .systemFont(ofSize: 13)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor, constant: 8).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: nameLabel!.leadingAnchor).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: nameLabel!.trailingAnchor).isActive = true
        self.loginLabel = loginLabel
    }
    
    private func DescriptionLabel() {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Hello, World!"
        descriptionLabel.textColor = UIColor(named: "YP White")
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: loginLabel!.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabel!.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: nameLabel!.trailingAnchor).isActive = true
    }
        
    private func ExitButton() {
        let exitButton = UIButton()
        exitButton.setImage(UIImage(named: "exit_button"), for: .normal)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        exitButton.leadingAnchor.constraint(greaterThanOrEqualTo: avatarView!.trailingAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    private func didTapExitButton() {
    }
}
