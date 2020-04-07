//
//  BooksAPIManager.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation
import Alamofire

class BooksAPIManager: NSObject {
    
    class func loadBooks(withKeywork keywork: String, nextPageToken: String?, success: @escaping (_: BooksResponse) -> Void, failure: @escaping (_: String) -> Void) {
        
        AF.request(BooksRouter.books(keywork: keywork, nextPageToken: nextPageToken)).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                do {
                    let decoder = JSONDecoder()
                    if let data = response.data {
                        let moviesResponse = try decoder.decode(BooksResponse.self, from: data)
//                        print(moviesResponse)
                        success(moviesResponse)
                    } else {
                        let errorMessage = "Parsing failed with error - No data received"
                        print(errorMessage)
                        failure(errorMessage)
                    }
                } catch let error {
                    let errorMessage = "Parsing failed with error: \(error)"
                    print(errorMessage)
                    failure(errorMessage)
                }
                
            case .failure(let error):
                let errorMessage = "Request failed with error: \(error)"
                print(errorMessage)
                failure(errorMessage)
            }
        }
    }
    
}
