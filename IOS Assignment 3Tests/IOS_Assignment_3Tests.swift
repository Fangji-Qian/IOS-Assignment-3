//
//  IOS_Assignment_3Tests.swift
//  IOS Assignment 3Tests
//
//  Created by admin on 5/10/24.
//

import XCTest
@testable import IOS_Assignment_3

class AithenticationTests: XCTestCase {
    var databaseManager: DatabaseManager!
    
    override func setUpWithError() throws {
        super.setUp()
        databaseManager = DatabaseManager.shared
    }
    
    override func tearDownWithError() throws {
        databaseManager = nil
        super.tearDown()
    }
    
    func testUserRegistration() throws {
        let email = "test@test.com"
        let password = "Test1234"
        XCTAssertTrue(databaseManager.registerUser(email: email, password: password), "User registration function test succed")
    }
    
    func testUserAuthentication() throws {
        let email = "test@test.com"
        let password = "Test1234"
        XCTAssertTrue(databaseManager.registerUser(email: email, password: password), "Registration authentication test succed")
        XCTAssertTrue(databaseManager.authenticateUser(email: email, password: password), "Authentication test succeed with correct credentials")
    }
    
    func testFailedAuthentication() throws {
        let email = "Wrong@test.com"
        let password = "wrong1234"
        XCTAssertTrue(databaseManager.registerUser(email: email, password: password), "Authentication test failed with wrong credentials")
    }
}
