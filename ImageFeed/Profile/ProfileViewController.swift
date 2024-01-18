//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 17.01.2024.
//

import Foundation
import UIKit

final class ProfileViewController: UIViewController {
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var loginNameLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var exitButton: UIButton!
    @IBAction private func didTapExitButton() {
    }
}
