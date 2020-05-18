//
//  SingleChoiceAttribute.swift
//  sparknetworks_coding_exercise
//
//  Created by Vishwas Mukund on 5/13/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

final class SingleChoiceAttribute: Decodable {
    var gender: [Gender]
    var ethnicity: [Ethnicity]
    var religion: [Religion]
    var figure: [Figure]
    var marital_status: [MaritalStatus]
}
