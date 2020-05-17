//
//  LocationView.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/17/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

extension LocationView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoCompleteEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = autoCompleteEntries[indexPath.row]
        return cell
    }
}

extension LocationView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        locationTableView.isHidden = false
        let substring = (textField.text! as NSString).replacingCharacters(in: range, with: string)

        searchAutocompleteEntriesWithSubstring(substring: substring)
        return true     // not sure about this - could be false
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autoCompleteEntries.removeAll(keepingCapacity: false)
        guard let list = viewModel?.locationList else { return }
        for curString in list.map({ $0.city }) {
            let myString:NSString! = curString as NSString

            let substringRange :NSRange! = myString.range(of: substring)

            if (substringRange.location  == 0)
            {
                autoCompleteEntries.append(curString)
            }
        }

        locationTableView.reloadData()
    }
}

class LocationView: UIView {
    
    var fieldType: TypeOfField?
    var viewModel: ProfileViewModel?
    var autoCompleteEntries = [String]()
    
    var locationTextfield: UITextField = {
        var textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield.layer.borderWidth = 0.5
        textfield.placeholder = "Start typing..."
        return textfield
    }()
    
    var locationTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(fieldType: TypeOfField?, viewModel: ProfileViewModel?) {
        self.init()
        self.fieldType = fieldType
        self.viewModel = viewModel
    
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        backgroundColor = .white
        addSubviews(views: locationTextfield, locationTableView)
        
        locationTableView.dataSource = self
        locationTableView.delegate = self
        locationTableView.isHidden = true
        
        locationTextfield.delegate = self
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            locationTextfield.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 2*UIElementSizes.standardPadding),
            locationTextfield.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationTextfield.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            locationTextfield.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            
            locationTableView.topAnchor.constraint(equalTo: locationTextfield.bottomAnchor, constant: UIElementSizes.standardPadding),
            locationTableView.centerXAnchor.constraint(equalTo: centerXAnchor),
            locationTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIElementSizes.standardPadding),
            locationTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -UIElementSizes.standardPadding),
            locationTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

