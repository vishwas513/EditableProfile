//
//  SelectionCell.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

final class SelectionCell: UITableViewCell {
    
    var selectionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    //This is to show which field is selected
    var checkMark: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "checkmark")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubviews(views: selectionLabel, checkMark)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            selectionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            selectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            selectionLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2),
            selectionLabel.heightAnchor.constraint(equalToConstant: UIElementSizes.sizeOfPlaceholderText),
            
            checkMark.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkMark.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            checkMark.widthAnchor.constraint(equalToConstant: UIElementSizes.sizeOfPlaceholderText),
            checkMark.heightAnchor.constraint(equalToConstant: UIElementSizes.sizeOfPlaceholderText),
        ])
        
    }
    
}
