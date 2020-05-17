//
//  TextEditController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit
import os.log

@objc extension TextEditController {
    func saveTapped() {
        let profile = viewModel?.profile
        
        if let newText = textEditView?.fieldTextfield.text {
            switch field {
            case .displayName:
                profile?.displayName = newText
            case . realName:
                profile?.realName = newText
            case .occupation:
                profile?.occupation = newText
            case .aboutMe:
                profile?.aboutMe = newText
            default:
                os_log("This code should never be reachable, check type of field sent")
            }
        }
        viewModel?.updateProfile()
        navigationController?.popViewController(animated: true)
    }
}

class TextEditController: UIViewController {
    
    var textEditView: TextEditView?
    var fieldName: String?
    var fieldValue: String?
    var field: TypeOfField?
    
    var viewModel:ProfileViewModel?
    
    init(fieldName: String, fieldValue: String, field: TypeOfField, viewModel: ProfileViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        self.field = field
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        textEditView = TextEditView(fieldName: fieldName ?? "", fieldValue: fieldValue ?? "")
        view = textEditView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItem = saveButton
        // Do any additional setup after loading the view.
    }
}
