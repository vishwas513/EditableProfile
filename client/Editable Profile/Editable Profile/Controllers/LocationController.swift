//
//  LocationController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/17/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

class LocationController: UIViewController {

    var locationView: LocationView?
    var fieldType: TypeOfField?
    var viewModel: ProfileViewModel?
    
    
    init(fieldType: TypeOfField, viewModel: ProfileViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.fieldType = fieldType
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        locationView = LocationView(fieldType: fieldType, viewModel: viewModel)
        view = locationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    

}
