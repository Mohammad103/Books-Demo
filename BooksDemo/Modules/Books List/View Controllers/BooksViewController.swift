//
//  BooksViewController.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class BooksViewController: UIViewController {

    // MARK: - UI Variables
    private var booksTableView: UITableView!
    
    // MARK: - Variables
    private var viewModel: BooksViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .greyF6F6F6
        
        viewModel = BooksViewModel()
        viewModel.delegate = self
        
        setupBooksTableViewUI()
        loadData()
    }
    
    
    // MARK: - Configure UI
    private func setupBooksTableViewUI() {
        booksTableView = UITableView()
        booksTableView.dataSource = self
        booksTableView.delegate = self
        booksTableView.rowHeight = 100
        booksTableView.estimatedRowHeight = 44
        booksTableView.backgroundColor = .clear
        booksTableView.translatesAutoresizingMaskIntoConstraints = false
        booksTableView.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.cellId)
        view.addSubview(booksTableView)
        
        booksTableView?.addInfiniteScroll(handler: { [weak self] (tableView) in
            guard let weakSelf = self else { return }
            weakSelf.loadData()
        })
        
        booksTableView?.setShouldShowInfiniteScrollHandler({ [weak self] (tableView) -> Bool in
            guard let weakSelf = self else { return false }
            return weakSelf.viewModel.shouldLoadMoreBooks()
        })
        
        setupTableHeaderView()
        booksTableView.tableFooterView = UIView()
        
        let margins = view.layoutMarginsGuide
        let topViewMargin = -1 * UIApplication.shared.windows[0].safeAreaInsets.top
        booksTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: topViewMargin).isActive = true
        booksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        booksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        booksTableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupTableHeaderView() {
        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: booksTableView.frame.width, height: 250))
        headerView.backgroundColor = .defaultAppColor
        let titleLabel: UILabel = UILabel()
        titleLabel.text = "Query: Harry"
        titleLabel.textColor = .greyF6F6F6
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 24)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        booksTableView.tableHeaderView = headerView
        
        titleLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: Data loading
    private func loadData() {
        viewModel.loadBooksForKeyword("harry")
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.totalBooksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.cellId, for: indexPath) as! BookTableViewCell
        cell.setupCell(book: viewModel.book(at: indexPath.row))
        return cell
    }
}


// MARK: - BooksViewModelDelegate
extension BooksViewController: BooksViewModelDelegate {
    func booksLoadedSuccessfully() {
        booksTableView.finishInfiniteScroll()
        booksTableView.reloadData()
    }
    
    func booksFailedWithError(_ errorMessage: String) {
        booksTableView.finishInfiniteScroll()
        
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
}
