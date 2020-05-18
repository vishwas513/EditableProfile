//
//  ProfileViewModel.swift
//  Editable Profile
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import Foundation
import os.log

final class ProfileViewModel {
    
    var singleAttributeChoices: SingleChoiceAttribute?
    var locationList: [Location]?
    var networkManager = NetworkManager.shared
    var profileView: ProfileView?
    var profile: ProfileModel?
    
    // This will trigger the downloads
    func initData() {
        retrieveProfile()
        retrieveChoices()
        retrieveLocations()
    }
    
    // This function returns the choices for a choice type
    func getChoices(field: TypeOfField) -> [String] {
        var result = [String]()
        guard let choices = singleAttributeChoices else { return [] }
        switch field {
        case .gender:
            result = choices.gender.map { $0.name }
        case .ethnicity:
            result = choices.ethnicity.map { $0.name }
        case .religion:
            result = choices.religion.map { $0.name }
        case .figure:
            result = choices.figure.map {$0.name}
        case .maritalStatus:
            result = choices.marital_status.map { $0.name }
        default:
            os_log("This code should not be reached, check enum")
        }
        return result.sorted()
    }
    
    
    func parseChoice(data: Data) -> SingleChoiceAttribute? {
        let jsonDecoder = JSONDecoder()
        var choices : SingleChoiceAttribute?
        do {
            choices = try jsonDecoder.decode(SingleChoiceAttribute.self, from: data)
        } catch {
            os_log("Error with parsing choices")
        }
        return choices
    }
    
    func parserLocation(data: Data) -> [Location]? {
        let jsonDecoder = JSONDecoder()
        var locationList : [Location]?
        do {
            locationList = try jsonDecoder.decode([Location].self, from: data)
        } catch {
            os_log("Error with parsing location")
        }
        return locationList
    }
    
    func parseProfile(data: Data) -> ProfileModel? {
        let jsonDecoder = JSONDecoder()
        var profileModel: ProfileModel?
        do {
            profileModel = try jsonDecoder.decode(ProfileModel.self, from: data)
        } catch {
            os_log("Error with parsing profile")
        }
        return profileModel
    }
    
    // There functions, performs networking and updates the viewmodel element in a memory safe way if successful, if failed displays an error and exits scope
    func retrieveChoices() {
        let urlString = "http://localhost:3000/single_choice_attributes"
        if let url = URL(string: urlString) {
            networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .singleChoiceAttributes), completion: {
                [weak self] result in
                
                switch result {
                case .success(let data):
                    if let strongSelf = self {
                        if let choices = strongSelf.parseChoice(data: data) {
                            strongSelf.singleAttributeChoices = choices
                        }
                    }
                case .failure(let error):
                    if let strongSelf = self {
                        DispatchQueue.main.async {
                            strongSelf.processError(error: error)
                        }
                        return
                        
                    }
                }
            })
        }
    }
    
    func retrieveLocations() {
        let urlString = "http://localhost:3000/cities"
        if let url = URL(string: urlString) {
            networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .location), completion: {
                [weak self] result in
                
                switch result {
                case .success(let data):
                    if let strongSelf = self {
                        strongSelf.locationList = strongSelf.parserLocation(data: data)
                    }
                case .failure(let error):
                    if let strongSelf = self {
                        DispatchQueue.main.async {
                            strongSelf.processError(error: error)
                        }
                        return
                    }
                }
            })
        }
    }
    
   func retrieveProfile() {
       let urlString = "http://localhost:3000/profile"
       if let url = URL(string: urlString) {
           networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .getProfile), completion: {
               [weak self] result in
               
               switch result {
               case .success(let data):
                   if let strongSelf = self {
                       if let profileObject = strongSelf.parseProfile(data: data) {
                           strongSelf.profile = profileObject
                           
                            // This is to avoid a race conition
                           DispatchQueue.main.async {
                               strongSelf.profileView?.editableOptionsTableView.reloadData()
                           }
                            return
                       }
                   }
               case .failure(let error):
                   if let strongSelf = self {
                       DispatchQueue.main.async {
                           strongSelf.processError(error: error)
                       }
                        return
                   }
               }
           })
       }
   }
    
    // This function formats the height into a Ft, in format
    func processHeight(height: Float) -> String? {
        
        let heightString = NSString(format: "%.2f", height)
        let heightComponents = heightString.components(separatedBy: ".")
        var resultString = String()
        
        guard let heightInFeet = heightComponents.first, let heightInInches = heightComponents.last else { return nil }
        
        resultString.append(heightInFeet)
        resultString.append("ft")
        resultString.append(" ")
        resultString.append(heightInInches)
        resultString.append("in")
        return resultString
    }
    
    // Used by cell to get the right values
    func getFieldValueFromIndex(fieldType: TypeOfField) -> String {
        guard let profile = self.profile else { return "" }
        var valueForField = ""
        
        switch fieldType {
        case .displayName:
            valueForField = profile.displayName
        case .realName:
            valueForField = profile.realName
        case .gender:
            valueForField = profile.gender
        case .birthday:
            valueForField = profile.birthday
        case .ethnicity:
            valueForField = profile.ethnicity
        case .religion:
            valueForField = profile.religion
        case .figure:
            valueForField = profile.figure
        case .height:
            valueForField = processHeight(height: profile.height) ?? ""
        case .location:
            valueForField = profile.city
        case .maritalStatus:
            valueForField = profile.maritalStatus
        case .occupation:
            valueForField = profile.occupation
        case .aboutMe:
            valueForField = profile.aboutMe
        }
        
        return valueForField
    }
    
    // Able to use for all type of updates
    func updateProfile() {
        let urlString = "http://localhost:3000/profile"
        
        if let url = URL(string: urlString) {
            let data = buildObjectForPutRequest()
            networkManager.put(urlRequest: networkManager.buildRequest(url: url, endpoint: .putProfile, payload: data), completion: { [weak self] result in
                switch result {
                case .failure(let error):
                    if let strongSelf = self {
                        DispatchQueue.main.async {
                            strongSelf.processError(error: error)
                        }
                         return
                    }
                case .success(_):
                    break
                }
            })
        }
    }
    
    // build object for put and convert into data block
    func buildObjectForPutRequest() -> Data {
        if let profile = profile {
            let dataDictionary: [String:Any] = [
                "displayName": profile.displayName,
                "realName": profile.realName,
                "gender": profile.gender,
                "ethnicity": profile.ethnicity,
                "birthday": profile.birthday,
                "religion": profile.religion,
                "figure": profile.figure,
                "maritalStatus": profile.maritalStatus,
                "aboutMe": profile.aboutMe,
                "height": profile.height,
                "occupation": profile.occupation,
                "city": profile.city,
                "lat": profile.lat,
                "lon": profile.lon
            ]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: dataDictionary)
                return jsonData
            } catch {
                os_log("Could not convert jsonObject to data for put, check viewModel")
            }
        }
        return Data()
    }
    
    // Notification because, showing error is a UI acticity and should not be done in a viewModel
    func processError(error: Error) {
        let payload = ["TypeOfError": ErrorTypes.serverNotResponding, "ErrorMessage":error.localizedDescription] as [String : Any]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: StaticContent.errorNotification), object: payload)
    }
}
