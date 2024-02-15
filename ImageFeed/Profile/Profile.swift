//
//  Profile.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 12.02.2024.
//

import Foundation

struct Profile {
    let username: String
    let firstName: String
    let lastName: String
    var name: String {
        return firstName + " " + lastName
    }
    var loginName: String {
        return "@" + username
    }
    var bio: String
}

