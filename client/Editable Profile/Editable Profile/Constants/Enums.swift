//
//  Enums.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

enum Something {
    case displayName, realName, gender, ethnicity, religion, height, figure, maritalStatus, occupation, aboutMe
}

enum Endpoint {
    case singleChoiceAttributes
    case location
    case profile
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}
