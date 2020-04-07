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
    private var nextPageToken: String?
    
    
    // MARK: - Data Access
    func loadBooksForKeyword(_ keyword: String) {
        BooksAPIManager.loadBooks(withKeywork: keyword, nextPageToken: nextPageToken, success: { [weak self] (response) in
            guard let weakSelf = self else { return }
            weakSelf.books.append(contentsOf: response.books)
            weakSelf.nextPageToken = response.nextPageToken
            weakSelf.delegate?.booksLoadedSuccessfully()
        }, failure: { [weak self] (errorMessage) in
            guard let weakSelf = self else { return }
            weakSelf.delegate?.booksFailedWithError(errorMessage)
        })
    }
    
    // MARK: - Setter methods
    func clearAll() {
        books = []
        nextPageToken = nil
    }
    
    // MARK: - Getter methods
    func totalBooksCount() -> Int {
        return books.count
    }
    
    func book(at index: Int) -> Book {
        return books[index]
    }
    
    func shouldLoadMoreBooks() -> Bool {
        return (nextPageToken != nil)
    }
}
