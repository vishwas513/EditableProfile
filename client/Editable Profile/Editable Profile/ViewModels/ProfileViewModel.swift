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
    
//    var singleAttributeChoices: SingleChoiceAttribute?
//    var locationList: [Location]?
//    let networkManager = NetworkManager.shared
//    
//    func initData() {
//        
//        getProfile()
//        getChoices()
//        getLocations()
//        
//    }
//    
//    func getChoices(field: Something) -> [String] {
//        var result = [String]()
//        guard let choices = singleAttributeChoices else { return [] }
//        switch field {
//        case .gender:
//            result = choices.gender.map { $0.name }
//        case .ethnicity:
//            result = choices.ethnicity.map { $0.name }
//        case .religion:
//            result = choices.religion.map { $0.name }
//        case .figure:
//            result = choices.figure.map {$0.name}
//        case .maritalStatus:
//            result = choices.marital_status.map { $0.name }
//        default:
//            os_log("This code should not be reached, check enum")
//        }
//        return result.sorted()
//    }
//    
//    
//    func parserChoice(data: Data) -> SingleChoiceAttribute? {
//        let jsonDecoder = JSONDecoder()
//        var choices : SingleChoiceAttribute?
//        do {
//            choices = try jsonDecoder.decode(SingleChoiceAttribute.self, from: data)
//        } catch {
//            print(error)
//        }
//        return choices
//    }
//    
//    func parserLocation(data: Data) -> [Location]? {
//        let jsonDecoder = JSONDecoder()
//        var locationList : [Location]?
//        do {
//            locationList = try jsonDecoder.decode([Location].self, from: data)
//        } catch {
//            print(error)
//        }
//        return locationList
//    }
//    
//    func parseProfile(data: Data) -> ProfileModel? {
//        let jsonDecoder = JSONDecoder()
//        var profileModel: ProfileModel?
//        do {
//            profileModel = try jsonDecoder.decode(ProfileModel.self, from: data)
//        } catch {
//            print(error)
//        }
//        return profileModel
//    }
//    
//    func getChoices() {
//        let urlString = "http://localhost:3000/single_choice_attributes"
//        if let url = URL(string: urlString) {
//            networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .singleChoiceAttributes), completion: {
//             [weak self] result in
//                
//                switch result {
//                case .success(let data):
//                    if let strongSelf = self {
//                    strongSelf.singleAttributeChoices = strongSelf.parserChoice(data: data)
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//                
//            })
//        }
//    }
//    
//    func getLocations() {
//        let urlString = "http://localhost:3000/cities"
//        if let url = URL(string: urlString) {
//            networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .location), completion: {
//            [weak self] result in
//                
//                switch result {
//                case .success(let data):
//                    if let strongSelf = self {
//                        strongSelf.locationList = strongSelf.parserLocation(data: data)
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            })
//        }
//    }
//    
//    var retriveProfile: Profile {
//        return CoreDataGetOps.shared.getProfile()
//    }
//    
//    func processDateObject(date: Date) -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        return dateFormatter.string(from: date)
//        
//    }
//    
//    func processHeight(height: Float) -> String? {
//        let heightString = NSString(format: "%.1f", height)
//        let heightComponents = heightString.components(separatedBy: ".")
//        var resultString = String()
//        
//        guard let heightInFeet = heightComponents.first, let heightInInches = heightComponents.last else { return nil }
//        
//        resultString.append(heightInFeet)
//        resultString.append("ft")
//        resultString.append(" ")
//        resultString.append(heightInInches)
//        resultString.append("in")
//        return resultString
//    }
//    
//    func getProfile() {
//        let urlString = "http://localhost:3000/profile"
//        if let url = URL(string: urlString) {
//            networkManager.get(urlRequest: networkManager.buildRequest(url: url, endpoint: .profile), completion: {
//               [weak self] result in
//                
//                switch result {
//                case .success(let data):
//                    if let strongSelf = self {
//                        if let profileObject = strongSelf.parseProfile(data: data) {
//                            CoreDataSaveOps.shared.saveProfile(profile: profileObject)
//                        }
//                    }
//                case .failure(let error):
//                    print(error.localizedDescription)
//                }
//            })
//        }
//        
//        
//    }
    
}
