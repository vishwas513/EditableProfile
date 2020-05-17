//
//  ViewController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit
import os.log

@objc extension ProfileController {
    func editButtonTappedForFreeText(notification: NSNotification) {
        guard let recievedObject = notification.object as? [String: Any],let fieldType = recievedObject["FieldType"] as? TypeOfField, let fieldName = recievedObject["FieldName"] as? String, let fieldValue = recievedObject["FieldValue"] as? String else { return }
        
        switch fieldType {
        case .displayName, .realName, .aboutMe, .occupation:
            let textEditController = TextEditController(fieldName: fieldName, fieldValue: fieldValue, field: fieldType, viewModel: viewModel)
            navigationController?.pushViewController(textEditController, animated: true)
            profileView = nil
        default:
            os_log("This code should not be reached, check ProfileController")
        }
    }
    
    func editButtonTappedForSelection(notification: NSNotification) {
        guard let recievedObject = notification.object as? [String: Any],let fieldType = recievedObject["FieldType"] as? TypeOfField else { return }
        
        let list = viewModel.getChoices(field: fieldType)
        let selectionController = SelectionController(list: list, field: fieldType, viewModel: viewModel)
        navigationController?.pushViewController(selectionController, animated: true)
        profileView = nil
    }
    
    func editButtonTappedForLocation(notification: NSNotification) {
        guard let recievedObject = notification.object as? [String: Any],let fieldType = recievedObject["FieldType"] as? TypeOfField else { return }
        
        let locationController = LocationController(fieldType: fieldType, viewModel: viewModel)
        navigationController?.pushViewController(locationController, animated: true)
        profileView = nil
    }
}

class ProfileController: UIViewController {
    
    var profileView: ProfileView?
    var viewModel = ProfileViewModel()
    
    override func loadView() {
        profileView = ProfileView()
        profileView?.viewModel = viewModel
        viewModel.profileView = profileView
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileView?.setupView()
        viewModel.initData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(editButtonTappedForFreeText), name: NSNotification.Name(rawValue: StaticContent.gotoDetailScreenNotificationName), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(editButtonTappedForSelection), name: NSNotification.Name(rawValue: StaticContent.gotoSelectionScreenNotificationName), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(editButtonTappedForLocation), name: NSNotification.Name(rawValue: StaticContent.gotoLocationScreenNotificationName), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.retrieveProfile()
    }
    
    
}

