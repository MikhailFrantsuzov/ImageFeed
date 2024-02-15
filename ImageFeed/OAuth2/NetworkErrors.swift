//
//  NetworkError.swift
//  ImageFeed
//
//  Created by Mikhail Frantsuzov on 06.02.2024.
//

import Foundation
extension URLSession {
    func objectTask<T: Decodable>(for request: URLRequest, completion: @escaping (Result<T, Error>) -> Void) -> URLSessionTask {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data,
               let response = response,
               let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if 200..<300 ~= statusCode {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let object = try? decoder.decode(T.self, from: data) else {
                        completion(.failure(NetworkErrors.invalidDecoding))
                        return
                    }
                    completion(.success(object))
                }
                else {
                    completion(.failure(error ?? NetworkErrors.httpStatusCode(statusCode)))
                    return
                }
            }
        }
        return task
    }
    
    enum NetworkErrors: Error {
        case invalidUrl
        case httpStatusCode(Int)
        case invalidDecoding
    }
}

extension URLRequest {
    static func makeHTTPRequest(
        path: String,
        httpMethod: String,
        baseURL: URL = defaultBaseURL
    ) -> URLRequest {
        guard let url = URL(string: path, relativeTo: baseURL) else {fatalError("Failed to create URL")}
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        return request
    }
}