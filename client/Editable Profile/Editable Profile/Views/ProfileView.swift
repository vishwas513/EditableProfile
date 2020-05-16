//
//  EditingView.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation
import UIKit

extension ProfileView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StaticStrings.editableOptionCellId) as? EditableOptionCell else {
            return UITableViewCell()
        }
        cell.fieldLabel.text = "default label"
        cell.fieldPlaceHolderLabel.text = "default text"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIElementSizes.heightOfCell
    }
}

class ProfileView: UIView {
    weak var viewModel: ProfileViewModel?
    
    var pictureManagementView: UIView = {
        var view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pictureEditButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(StaticStrings.editButtonText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.gray.cgColor
        return button
    }()
    
    var editableOptionsTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    init(viewModel: ProfileViewModel) {
        self.init()
      //  self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubviews(views: pictureManagementView, pictureEditButton, editableOptionsTableView)
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        editableOptionsTableView.dataSource = self
        editableOptionsTableView.delegate = self
        editableOptionsTableView.separatorStyle = .none
        editableOptionsTableView.register(EditableOptionCell.self, forCellReuseIdentifier: StaticStrings.editableOptionCellId)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            pictureManagementView.topAnchor.constraint(equalTo: topAnchor, constant: 2 * UIElementSizes.standardPadding),
            pictureManagementView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            pictureManagementView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            pictureManagementView.heightAnchor.constraint(equalToConstant: UIElementSizes.screenHeight/3),
            
            pictureEditButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            pictureEditButton.topAnchor.constraint(equalTo: pictureManagementView.bottomAnchor, constant: UIElementSizes.standardPadding),
            pictureEditButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            pictureEditButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            
            editableOptionsTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            editableOptionsTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            editableOptionsTableView.topAnchor.constraint(equalTo: pictureEditButton.bottomAnchor, constant: 2*UIElementSizes.standardPadding),
            editableOptionsTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            editableOptionsTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
