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
        //The scope of this test is networkManager, retriveChoices, parseChoices
        var listOfChoices = viewModel?.getChoices(field: .gender)
        XCTAssertEqual(listOfChoices?.count, 0)
        
        viewModel?.retrieveChoices()
        sleep(2)
        listOfChoices = viewModel?.getChoices(field: .gender)
        XCTAssertEqual(listOfChoices?.count, 3)
        
        XCTAssertNotNil(listOfChoices?.contains("Male"))
        XCTAssertNotNil(listOfChoices?.contains("Female"))
        XCTAssertNotNil(listOfChoices?.contains("Other"))
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
