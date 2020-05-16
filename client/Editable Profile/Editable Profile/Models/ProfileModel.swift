//
//  ProfileModel.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

class ProfileModel: Decodable {
    var displayName: String
    var realName: String
    var gender: String
    var birthday: String
    var religion: String
    var ethnicity: String
    var height: Float
    var figure: String
    var maritalStatus: String
    var occupation: String
    var aboutMe: String
    var location: String
}
