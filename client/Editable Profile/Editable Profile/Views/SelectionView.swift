//
//  SelectionVieew.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

import UIKit
import os.log

extension SelectionView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StaticContent.selectionScreenCellId) as? SelectionCell else { return UITableViewCell() }
        cell.selectionLabel.text = list?[indexPath.row] ?? ""
        
//        if cell.selectionLabel.text == currentSelection {
//            cell.checkMark.isHidden = false
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   let profile = profileviewModel.retriveProfile
        
//        switch field {
//        case .gender:
//            profile.gender = viewModel?.datasource?[indexPath.row]
//        case .ethnicity:
//            profile.ethnicity = viewModel?.datasource?[indexPath.row]
//        case .religion:
//            profile.religion = viewModel?.datasource?[indexPath.row]
//        case .figure:
//            profile.figure = viewModel?.datasource?[indexPath.row]
//        case .maritalStatus:
//            profile.maritalStatus = viewModel?.datasource?[indexPath.row]
//
//        default:
//            os_log("Check SelectionView, update not working for type")
//        }
        
     //   CoreDataUpdateOps.shared.updateProfile(profile: profile)
        
 //       NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "selectPopforNavController"), object: nil))
        
    }
}

class SelectionView: UIView {
    
    var viewModel: ProfileViewModel?
    var field: TypeOfField?
    var list: [String]?
    
    var selectionsTableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setupView()
    }
    
    init(field: TypeOfField, viewModel: ProfileViewModel, list: [String]) {
        self.init()
        self.field = field
        self.viewModel = viewModel
        self.list = list
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
        addSubview(selectionsTableView)
    
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        selectionsTableView.dataSource = self
        selectionsTableView.delegate = self
        selectionsTableView.register(SelectionCell.self, forCellReuseIdentifier: StaticContent.selectionScreenCellId)
//        let indexPath = IndexPath(row: viewModel?.selection ?? 0, section: 0)
//        let cell = selectionsTableView.cellForRow(at: indexPath) as? SelectionCell
//
//        cell?.checkMark.isHidden = false
    }
    
    func refreshSelection() {
        
        
       // let indexPath = IndexPath(row: viewModel?.selection ?? 0, section: 0)
       // let cell = selectionsTableView.cellForRow(at: indexPath) as? SelectionCell
       // cell?.checkMark.isHidden = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            selectionsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            selectionsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            selectionsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            selectionsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

