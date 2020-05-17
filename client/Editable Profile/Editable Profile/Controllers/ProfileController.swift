//
//  ViewController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

@objc extension ProfileController {
    func editButtonTapped(notification: NSNotification) {
        guard let recievedObject = notification.object as? [String: Any],let fieldType = recievedObject["FieldType"] as? TypeOfField, let fieldName = recievedObject["FieldName"] as? String, let fieldValue = recievedObject["FieldValue"] as? String else { return }
        
        switch fieldType {
        case .displayName, .realName, .aboutMe, .occupation:
            let textEditController = TextEditController(fieldName: fieldName, fieldValue: fieldValue, field: fieldType, viewModel: viewModel)
            navigationController?.pushViewController(textEditController, animated: true)
            profileView = nil
        default:
            print("hi")
        }
        
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(editButtonTapped), name: NSNotification.Name(rawValue: StaticContent.gotoDetailScreenNotificationName), object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.retrieveProfile()
    }
    
    
}

