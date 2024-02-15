//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 17.01.2024.
//

import Foundation
import UIKit
import Kingfisher

final class ProfileViewController: UIViewController {
    private let profileService = ProfileService.shared
    private var avatarViewImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
    private var nameLabelUI: UILabel?
    private var loginLabelUI: UILabel?
    private var profileImageServiceObserver: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageServiceObserver = NotificationCenter.default
            .addObserver(
                forName: ProfileImageService.didChangeNotification,
                object: nil,
                queue: .main) {[weak self] _ in
                    guard let self = self else { return }
                    self.updateAvatar()
                }
        updateAvatar()
        
        guard let profile = profileService.profile else {return}
        
        view.backgroundColor = UIColor(named: "YP Black")
        createAvatarView()
        createNameLabel(profile.name)
        createLoginLabel(profile.loginName)
        createDescriptionLabel(profile.bio)
        createExitButton()
    }
    
    // MARK: - Private func
    
    private func updateAvatar() {
        guard
            let profileImageURL = ProfileImageService.shared.avatarURL,
            let url = URL(string: profileImageURL)
        else { return }
        avatarViewImage.kf.indicatorType = .activity
        let processor = RoundCornerImageProcessor(cornerRadius: 40)
        avatarViewImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "user_ava"),
            options: [.processor(processor)])
    }
    
    private func createAvatarView() {
        let avatarView = avatarViewImage
        avatarView.layer.cornerRadius = 35
        avatarView.layer.masksToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarView)
        avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        avatarView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        avatarView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        
    }
    
    private func createNameLabel(_ name: String) {
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.textColor = UIColor(named: "YP White")
        nameLabel.font = .boldSystemFont(ofSize: 23)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.avatarViewImage.bottomAnchor, constant: 8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarViewImage.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        self.nameLabelUI = nameLabel
    }
    
    private func createLoginLabel(_ login: String) {
        let loginLabel = UILabel()
        loginLabel.text = login
        loginLabel.textColor = UIColor(named: "YP Gray")
        loginLabel.font = .systemFont(ofSize: 13)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: nameLabelUI!.bottomAnchor, constant: 8).isActive = true
        loginLabel.leadingAnchor.constraint(equalTo: nameLabelUI!.leadingAnchor).isActive = true
        loginLabel.trailingAnchor.constraint(equalTo: nameLabelUI!.trailingAnchor).isActive = true
        self.loginLabelUI = loginLabel
    }
    
    private func createDescriptionLabel(_ bio: String) {
        let descriptionLabel = UILabel()
        descriptionLabel.text = bio
        descriptionLabel.textColor = UIColor(named: "YP White")
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: loginLabelUI!.bottomAnchor, constant: 8).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: nameLabelUI!.leadingAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: nameLabelUI!.trailingAnchor).isActive = true
    }
    
    private func createExitButton() {
        let exitButton = UIButton()
        exitButton.setImage(UIImage(named: "exit_button"), for: .normal)
        exitButton.addTarget(self, action: #selector(Self.didTapExitButton), for: UIControl.Event.touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(exitButton)
        exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55).isActive = true
        exitButton.leadingAnchor.constraint(greaterThanOrEqualTo: avatarViewImage.trailingAnchor).isActive = true
        exitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
    }
    
    @objc
    private func didTapExitButton() {
        
    }
}
