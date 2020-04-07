//
//  BookTableViewCell.swift
//  BooksDemo
//
//  Created by Mohammad Shaker on 4/7/20.
//  Copyright © 2020 Mohammad Shaker. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    // MARK: - Static Variables
    static let cellId = "BookTableViewCell"
    
    // MARK: - UI Variables
    private var coverImageView = UIImageView()
    private var labelsStackView: UIStackView!
    private var titleLabel = UILabel()
    private var authorsLabel = UILabel()
    private var narratorsLabel = UILabel()
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupCoverImageUI()
        setupLabelsUI()
    }
    
    required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure UI
    private func setupLabelsUI() {
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 14.0)
        authorsLabel.font = UIFont(name: "Avenir", size: 12.0)
        narratorsLabel.font = UIFont(name: "Avenir", size: 12.0)
        
        labelsStackView = UIStackView(arrangedSubviews: [titleLabel, authorsLabel, narratorsLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        labelsStackView.distribution = .fillProportionally
        labelsStackView.spacing = 5
        contentView.addSubview(labelsStackView)
        
        let margins = contentView.layoutMarginsGuide
        labelsStackView.leadingAnchor.constraint(equalTo: coverImageView.trailingAnchor, constant: 16).isActive = true
        labelsStackView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        labelsStackView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10).isActive = true
        labelsStackView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10).isActive = true
    }
    
    private func setupCoverImageUI() {
        coverImageView.image = #imageLiteral(resourceName: "placeholder")
        coverImageView.layer.masksToBounds = true
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coverImageView)
        
        let margins = contentView.layoutMarginsGuide
        coverImageView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        coverImageView.widthAnchor.constraint(equalTo: coverImageView.heightAnchor).isActive = true
        coverImageView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 0).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: 0).isActive = true
    }
    
    
    // MARK: - Setup cell
    func setupCell(book: Book) {
        titleLabel.text = book.title
        authorsLabel.text = book.authorsDescription()
        narratorsLabel.text = book.narratorsDescription()
    }
}
