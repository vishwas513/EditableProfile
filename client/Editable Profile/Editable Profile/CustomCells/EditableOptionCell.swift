//
//  EditableOptionCell.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit
import os.log

@objc extension EditableOptionCell {
    func editButtonTapped(sender: UIButton) {
        let selectedItemType: TypeOfField = StaticContent.namesOfFieldsInOrder[sender.tag].1
        var payload = [String: Any]()
        
        switch selectedItemType {
        case .displayName, .realName, .occupation, .aboutMe:
            if let fieldName = fieldPlaceHolderLabel.text, let fieldValue = fieldLabel.text {
            payload = ["FieldType": selectedItemType, "FieldName": fieldName, "FieldValue": fieldValue]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: StaticContent.gotoDetailScreenNotificationName) , object: payload)
            }
        case .gender, .ethnicity, .religion, .figure, .maritalStatus:
            payload = ["FieldType": selectedItemType]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: StaticContent.gotoSelectionScreenNotificationName) , object: payload)
            
        case .location:
            payload = ["FieldType": selectedItemType]
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: StaticContent.gotoLocationScreenNotificationName), object: payload)
        default:
            os_log("This code is unreachable")
        }
    }
}

final class EditableOptionCell: UITableViewCell {
    var fieldPlaceHolderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: UIElementSizes.sizeOfPlaceholderText)
        return label
    }()
    
    var fieldLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    
    var editButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pencil"), for: .normal)
        return button
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubviews(views: fieldPlaceHolderLabel, fieldLabel, editButton)
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            fieldPlaceHolderLabel.topAnchor.constraint(equalTo: topAnchor, constant: UIElementSizes.standardPadding),
            fieldPlaceHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            fieldPlaceHolderLabel.heightAnchor.constraint(equalToConstant: UIElementSizes.sizeOfPlaceholderText),
            fieldPlaceHolderLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor),
            
            fieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            fieldLabel.topAnchor.constraint(equalTo: fieldPlaceHolderLabel.bottomAnchor, constant: UIElementSizes.standardPadding),
            fieldLabel.heightAnchor.constraint(equalToConstant: UIElementSizes.sizeOfPlaceholderText),
            fieldLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            editButton.leadingAnchor.constraint(equalTo: fieldPlaceHolderLabel.trailingAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
