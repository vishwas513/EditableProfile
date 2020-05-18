//
//  Strings.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation

struct StaticContent {
    
    //Static text that appear in the UI
    static let editButtonText = "Edit your picture"
    static let editableOptionCellId = "profileCell"
    static let selectionScreenCellId = "selectionCell"
    static let locationTextFieldPlaceholder = "Start typing..."
    
    // Notification names
    static let gotoDetailScreenNotificationName = "gotoDetailScreenNotificationName"
    static let gotoSelectionScreenNotificationName = "gotoSelectionScreenNotificationName"
    static let selectPopforNavControllerNotificationName = "selectPopforNavController"
    static let gotoLocationScreenNotificationName = "gotoLocationScreen"
    static let popFromLocationScreen = "popFromLocationScreen"
    static let errorNotification = "errorNotification"
    
    // Using the tableView in a very static way
    static let numberOfEditableOptions: Int = 12

    //This can be generated automatically from the dictionary if we are ever interested in dynamic types.
    static let namesOfFieldsInOrder:[(String,TypeOfField)] = [("Display Name", TypeOfField.displayName), ("Real Name",TypeOfField.realName), ("Gender",TypeOfField.gender), ("Birthday", TypeOfField.birthday), ("Religion", TypeOfField.religion), ("Ethnicity",TypeOfField.ethnicity), ("Height",TypeOfField.height), ("Figure",TypeOfField.figure), ("Marital Status", TypeOfField.maritalStatus), ("Occupation", TypeOfField.occupation),("Location", TypeOfField.location), ("About Me",TypeOfField.aboutMe)]
    
    // Titles and messages for alerts
    static let serverNotRespondingAlertTitle = "Warning"
    static let serverNotRespondingAlertMessage = "Server not responding, try restarting."
    static let emptyTextAlertMessage = "Cannot Save"
    static let emptyTextAlertTitle = "Field should not be empty"
    
}
