//
//  SelectionController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit


@objc extension SelectionController {
    func selectionMade() {
        navigationController?.popViewController(animated: true)
    }
}

class SelectionController: UIViewController {
    
    var selectionView: SelectionView?
    var field: TypeOfField?
    var viewModel: ProfileViewModel?
    var listOfItems: [String]?
    
    init(list: [String], field: TypeOfField, viewModel: ProfileViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.listOfItems = list
        self.field = field
        self.viewModel = viewModel
        selectionView = SelectionView(field: field, viewModel: viewModel, list: list)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        selectionView?.setupTableView()
        view = selectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectionMade), name: NSNotification.Name(rawValue: "selectPopforNavController"), object: nil)
    }
}

