//
//  TextEditController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

@objc extension TextEditController {
    func saveTapped() {
        //let profile = viewModel.retriveProfile
        
//        switch field {
//        case .displayName:
//            profile.displayName = textEditView?.fieldTextfield.text
//        case .realName:
//            profile.realName = textEditView?.fieldTextfield.text
//        case .occupation:
//            profile.occupation = textEditView?.fieldTextfield.text
//        case .aboutMe:
//            profile.aboutMe = textEditView?.fieldTextfield.text
//        default:
//            print("hi")
//        }
//        navigationController?.popViewController(animated: true)
    }
}

class TextEditController: UIViewController {
    
    var textEditView: TextEditView?
    var fieldName: String?
    var fieldValue: String?
    var field: TypeOfField?
    
    var viewModel = ProfileViewModel()
    
    init(fieldName: String, fieldValue: String, field: TypeOfField) {
        super.init(nibName: nil, bundle: nil)
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        self.field = field
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
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
