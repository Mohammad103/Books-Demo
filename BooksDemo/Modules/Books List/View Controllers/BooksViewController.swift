//
//  BooksViewController.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {

    private var booksTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .greyF6F6F6
        setupBooksTableViewUI()
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
        setupTableHeaderView()
        
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
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension BooksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.cellId, for: indexPath) as! BookTableViewCell
        cell.setupwithTitle("Test title", authors: "By: Author 1, Author 2", narrators: "With: Narrator 1, Narrator 2", coverImageURL: "")
        return cell
    }
}
