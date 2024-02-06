//
//  NetworkError.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 06.02.2024.
//

import Foundation

enum NetworkErrors: Error {
    case invalidUrl
    case httpStatusCode(Int)
    case invalidDecoding
}
