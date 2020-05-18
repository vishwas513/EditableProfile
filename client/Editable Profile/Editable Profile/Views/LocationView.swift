//
//  LocationView.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/17/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

// The tableView functions
extension LocationView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autoCompleteEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = autoCompleteEntries[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profie = viewModel?.profile
        let currentSelection = autoCompleteEntries[indexPath.row]
        profie?.city = currentSelection
        
        if let locationList = viewModel?.locationList, let locationObject = locationList.filter({$0.city == currentSelection}).first {
            profie?.lat = locationObject.lat
            profie?.lon = locationObject.lon
        }
        
        viewModel?.updateProfile()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: StaticContent.popFromLocationScreen), object: nil)
    }
}

// For autocomplete
extension LocationView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        locationTableView.isHidden = false
        if let text = textField.text  {
            let substring = (text as NSString).replacingCharacters(in: range, with: string)
            searchAutocompleteEntriesWithSubstring(substring: substring)
        }
        return true
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autoCompleteEntries.removeAll(keepingCapacity: false)
        guard let list = viewModel?.locationList else { return }
        for currentString in list.map({ $0.city }) {
            
            let myString = currentString as NSString
            let substringRange = myString.range(of: substring)

            if substringRange.location  == 0 {
                autoCompleteEntries.append(currentString)
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
        textfield.placeholder = StaticContent.locationTextFieldPlaceholder
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
        
        locationTextfield.delegate = self
        locationTableView.dataSource = self
        locationTableView.delegate = self
        
        locationTableView.isHidden = true

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

