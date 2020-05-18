//
//  Enums.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

enum TypeOfField {
    case displayName, realName, birthday, gender, ethnicity, religion, height, figure, maritalStatus, occupation, aboutMe, location
}

enum Endpoint {
    case singleChoiceAttributes
    case location
    case getProfile
    case putProfile
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

enum ErrorTypes {
    case serverNotResponding
}
