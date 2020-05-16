//
//  ViewController.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {

    var profileView: ProfileView?
    var viewModel = ProfileViewModel()
    
    override func loadView() {
        profileView = ProfileView()
        profileView?.viewModel = viewModel
        
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        profileView?.setupView()
        viewModel.initData()
    }


}

