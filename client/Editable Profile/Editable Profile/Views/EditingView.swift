//
//  EditingView.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit
import os.log

class EditingView: UIView {
    var fieldPlaceHolderLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(editable: Bool = true) {
        self.init()
        if !editable {
            editButton.isHidden = true
            editButton.isEnabled = false
        }
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubviews(views: fieldPlaceHolderLabel, fieldLabel, editButton)
        setupConstraints()
        
        editButton.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
    }
    
    @objc func editButtonTapped(sender: UIButton) {
        var payload = [String: TypeOfField]()
        switch sender.tag {
        case TagSystem.displayNameTag:
            payload = ["Field": .displayName]
        case TagSystem.realNameEditButtonTag:
            payload = ["Field": .realName]
        case TagSystem.genderTag:
            payload = ["Field": .gender]
        case TagSystem.ethnincityEditButtonTag:
            payload = ["Field": .ethnicity]
        case TagSystem.religionEditButtonTag:
            payload = ["Field": .religion]
        case TagSystem.figureEditButtonTag:
            payload = ["Field": .figure]
        case TagSystem.martialStatusEditButtonTag:
            payload = ["Field": .maritalStatus]
        case TagSystem.occupationEditButtonTag:
            payload = ["Field": .occupation]
        case TagSystem.aboutMeEditButtonTag:
            payload = ["Field": .aboutMe]
        default:
           os_log("Check profileView, this is because editButton is not sending the payload for this type")
        }
        
        NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "genderEditButtonTapped"),object: payload))
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            fieldPlaceHolderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            fieldPlaceHolderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            fieldPlaceHolderLabel.heightAnchor.constraint(equalToConstant: 20),
            fieldPlaceHolderLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor),
            
            fieldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            fieldLabel.topAnchor.constraint(equalTo: fieldPlaceHolderLabel.bottomAnchor, constant: 5),
            fieldLabel.heightAnchor.constraint(equalToConstant: 20),
            fieldLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor),
            
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            editButton.leadingAnchor.constraint(equalTo: fieldPlaceHolderLabel.trailingAnchor),
            editButton.heightAnchor.constraint(equalToConstant: 40),
            editButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
}
