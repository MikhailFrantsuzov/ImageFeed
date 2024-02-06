//
//  ResponseBody.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 06.02.2024.
//

import Foundation

struct ResponseBody: Decodable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let createdAt: Int
}
