//
//  BooksRouter.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation
import Alamofire

enum BooksRouter: URLRequestConvertible {
    case books(keywork: String, nextPageToken: String?)
    
    // MARK: - HTTPMethod
    private var method: HTTPMethod {
        switch self {
        case .books:
            return .get
        }
    }
    
    // MARK: - Path
    private var path: String {
        switch self {
        case .books(let keywork, let nextPageToken):
            if let nextPageToken = nextPageToken {
                return "search?query=\(keywork)&page=\(nextPageToken)"
            }
            return "search?query=\(keywork)"
        }
    }
    
    // MARK: - Parameters
    private var parameters: Parameters? {
        switch self {
        case .books:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        var url = K.Server.baseURL + path
        url = url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
