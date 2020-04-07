//
//  BooksViewModel.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import Foundation

protocol BooksViewModelDelegate: AnyObject {
    func booksLoadedSuccessfully()
    func booksFailedWithError(_ errorMessage: String)
}


class BooksViewModel {
    
    // MARK: - Variables
    weak var delegate: BooksViewModelDelegate?
    private var books: [Book] = []
    
    
    // MARK: - Data Access
    func loadBooksForKeyword(_ keyword: String, nextPageToken: String? = nil) {
        BooksAPIManager.loadBooks(withKeywork: keyword, nextPageToken: nextPageToken, success: { [weak self] (response) in
            guard let weakSelf = self else { return }
            weakSelf.books = response.books
            weakSelf.delegate?.booksLoadedSuccessfully()
        }, failure: { [weak self] (errorMessage) in
            guard let weakSelf = self else { return }
            weakSelf.delegate?.booksFailedWithError(errorMessage)
        })
    }
    
    
    // MARK: - Getter methods
    func totalBooksCount() -> Int {
        return books.count
    }
    
    func book(at index: Int) -> Book {
        return books[index]
    }
}
