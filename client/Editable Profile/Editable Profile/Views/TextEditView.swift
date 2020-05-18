//
//  TextEditView.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

class TextEditView: UIView {
    
    var fieldLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: UIElementSizes.sizeOfPlaceholderText)
        return label
    }()
    
    var fieldTextfield: UITextView = {
        var textfield = UITextView()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.backgroundColor = .black
        textfield.textColor = .white
        textfield.layer.cornerRadius = UIElementSizes.cornerRadius
        textfield.clipsToBounds = true
        return textfield
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //  setupView()
    }
    
    init(fieldName: String, fieldValue: String) {
        self.init()
        fieldLabel.text = fieldName
        fieldTextfield.text = fieldValue
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubviews(views: fieldLabel, fieldTextfield)

        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            fieldLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            fieldLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fieldLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            fieldTextfield.topAnchor.constraint(equalTo: fieldLabel.bottomAnchor, constant: 10),
            fieldTextfield.centerXAnchor.constraint(equalTo: centerXAnchor),
            fieldTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            fieldTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            fieldTextfield.heightAnchor.constraint(equalToConstant: UIElementSizes.screenWidth/4),
        ])
    }
}
