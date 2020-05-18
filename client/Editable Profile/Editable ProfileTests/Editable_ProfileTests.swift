//
//  Editable_ProfileTests.swift
//  Editable ProfileTests
//
//  Created by Vishwas Mukund on 5/16/20.
//  Copyright © 2020 Vishwas Mukund. All rights reserved.
//

import XCTest
@testable import Editable_Profile

class Editable_ProfileTests: XCTestCase {
    
    var viewModel: ProfileViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ProfileViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    func testInitDataFunction() {
        // This is an integration test for test all datasets
        XCTAssertNil(viewModel?.singleAttributeChoices)
        XCTAssertNil(viewModel?.locationList)
        XCTAssertNil(viewModel?.profile)
        
        viewModel?.initData()
        sleep(6)
        XCTAssertNotNil(viewModel?.singleAttributeChoices)
        XCTAssertNotNil(viewModel?.locationList)
        XCTAssertNotNil(viewModel?.profile)
        
    }
    
    func testGetChoices() {
        var listOfChoices = viewModel?.getChoices(field: .gender)
        XCTAssertEqual(listOfChoices?.count, 0)
        
        viewModel?.retrieveChoices()
        sleep(2)
        listOfChoices = viewModel?.getChoices(field: .gender)
        XCTAssertEqual(listOfChoices?.count, 3)
    }
    
    func testGenderOptions() {
        viewModel?.retrieveChoices()
        sleep(2)
        
        let listOfChoices = viewModel?.getChoices(field: .gender)
        XCTAssertNotNil(listOfChoices?.contains("Male"))
        XCTAssertNotNil(listOfChoices?.contains("Female"))
        XCTAssertNotNil(listOfChoices?.contains("Other"))
    }
    
    func testEthnicityOptions() {
        viewModel?.retrieveChoices()
        sleep(2)
        
        let listOfChoices = viewModel?.getChoices(field: .ethnicity)
        
        XCTAssertEqual(listOfChoices?.count, 11)
        
        XCTAssertNotNil(listOfChoices?.contains("White"))
        XCTAssertNotNil(listOfChoices?.contains("South Asian"))
        XCTAssertNotNil(listOfChoices?.contains("South East Asian"))
        XCTAssertNotNil(listOfChoices?.contains("Mixed"))
        XCTAssertNotNil(listOfChoices?.contains("Black"))
        XCTAssertNotNil(listOfChoices?.contains("Arabic"))
        XCTAssertNotNil(listOfChoices?.contains("Hispanic"))
        XCTAssertNotNil(listOfChoices?.contains("Latino"))
        XCTAssertNotNil(listOfChoices?.contains("Native American"))
        XCTAssertNotNil(listOfChoices?.contains("Pacific Islander"))
        XCTAssertNotNil(listOfChoices?.contains("Other"))
    }
    
    func testReligionOptions() {
        viewModel?.retrieveChoices()
        sleep(2)
        
        let listOfChoices = viewModel?.getChoices(field: .religion)
        
        XCTAssertEqual(listOfChoices?.count, 10)
        
        XCTAssertNotNil(listOfChoices?.contains("Agnostic"))
        XCTAssertNotNil(listOfChoices?.contains("Atheist"))
        XCTAssertNotNil(listOfChoices?.contains("Buddhist"))
        XCTAssertNotNil(listOfChoices?.contains("Christian"))
        XCTAssertNotNil(listOfChoices?.contains("Hindu"))
        XCTAssertNotNil(listOfChoices?.contains("Islam"))
        XCTAssertNotNil(listOfChoices?.contains("Jewish"))
        XCTAssertNotNil(listOfChoices?.contains("Shinto"))
        XCTAssertNotNil(listOfChoices?.contains("Sikh"))
        XCTAssertNotNil(listOfChoices?.contains("Other"))
        
    }
    
    func testFigureOptions() {
        viewModel?.retrieveChoices()
        sleep(2)
        
        let listOfChoices = viewModel?.getChoices(field: .figure)
        
        XCTAssertEqual(listOfChoices?.count, 5)
        
        XCTAssertNotNil(listOfChoices?.contains("Slim"))
        XCTAssertNotNil(listOfChoices?.contains("Normal"))
        XCTAssertNotNil(listOfChoices?.contains("Athletic"))
        XCTAssertNotNil(listOfChoices?.contains("A few extra kilos"))
        XCTAssertNotNil(listOfChoices?.contains("More to love"))
    }
    
    func testMartitalStatusOptions() {
        viewModel?.retrieveChoices()
        sleep(2)
        
        let listOfChoices = viewModel?.getChoices(field: .maritalStatus)
        
        XCTAssertEqual(listOfChoices?.count, 4)
        
        XCTAssertNotNil(listOfChoices?.contains("Never Married"))
        XCTAssertNotNil(listOfChoices?.contains("Divorced"))
        XCTAssertNotNil(listOfChoices?.contains("Widower"))
        XCTAssertNotNil(listOfChoices?.contains("Separated"))
    }
    
    
    
    func testParseChoice() {
        XCTAssertNil(viewModel?.singleAttributeChoices)
        viewModel?.retrieveChoices()
        sleep(2)
        XCTAssertNotNil(viewModel?.singleAttributeChoices)
    }
    
    func testParseLocation() {
        XCTAssertNil(viewModel?.locationList)
        viewModel?.retrieveLocations()
        sleep(2)
        XCTAssertNotNil(viewModel?.locationList)
    }
    
    func testParseProfile() {
        XCTAssertNil(viewModel?.profile)
        viewModel?.retrieveProfile()
        sleep(2)
        XCTAssertNotNil(viewModel?.profile)
    }
    
    func testRetrieveChoices() {
        XCTAssertNil(viewModel?.singleAttributeChoices)
        viewModel?.retrieveChoices()
        sleep(2)
        XCTAssertNotNil(viewModel?.singleAttributeChoices)
    }
    
    func testRetrieveLocations() {
        XCTAssertNil(viewModel?.locationList)
        viewModel?.retrieveLocations()
        sleep(2)
        XCTAssertNotNil(viewModel?.locationList)
    }
    
    func testRetrieveProfile() {
        XCTAssertNil(viewModel?.profile)
        viewModel?.retrieveProfile()
        sleep(2)
        XCTAssertNotNil(viewModel?.profile)
    }
    
    func testProcessHeight() {
        XCTAssertEqual(viewModel?.processHeight(height: 5.07), "5ft 07in")
        XCTAssertEqual(viewModel?.processHeight(height: 6.10), "6ft 10in")
        XCTAssertNotEqual(viewModel?.processHeight(height: 6.02), "6ft2in")
        XCTAssertNotEqual(viewModel?.processHeight(height: 6.2), "62in")
        XCTAssertNotEqual(viewModel?.processHeight(height: 6.2), "6ft2")
        XCTAssertNotEqual(viewModel?.processHeight(height: 6.2), "6.2")
    }
    
    func testGetFieldValueFromIndex() {
        viewModel?.initData()
        sleep(2)
        let profile = viewModel?.profile
        
        XCTAssertEqual(profile?.gender, viewModel?.getFieldValueFromIndex(fieldType: .gender))
        XCTAssertEqual(profile?.aboutMe, viewModel?.getFieldValueFromIndex(fieldType: .aboutMe))
        XCTAssertEqual(profile?.birthday, viewModel?.getFieldValueFromIndex(fieldType: .birthday))
        XCTAssertEqual(profile?.city, viewModel?.getFieldValueFromIndex(fieldType: .location))
        XCTAssertEqual(profile?.displayName, viewModel?.getFieldValueFromIndex(fieldType: .displayName))
        XCTAssertEqual(profile?.realName, viewModel?.getFieldValueFromIndex(fieldType: .realName))
        XCTAssertEqual(profile?.ethnicity, viewModel?.getFieldValueFromIndex(fieldType: .ethnicity))
        XCTAssertEqual(profile?.figure, viewModel?.getFieldValueFromIndex(fieldType: .figure))
        XCTAssertEqual(profile?.maritalStatus, viewModel?.getFieldValueFromIndex(fieldType: .maritalStatus))
        XCTAssertEqual(profile?.occupation, viewModel?.getFieldValueFromIndex(fieldType: .occupation))
        XCTAssertEqual(profile?.realName, viewModel?.getFieldValueFromIndex(fieldType: .realName))
    }
}
