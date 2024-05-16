//
//  DatabaseManager.swift
//  IOS Assignment 3
//
//  Created by admin on 5/14/24.
//

import Foundation
import SQLite3

class DatabaseManager {
    static let shared = DatabaseManager()
    private var db: OpaquePointer?
    
    init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("UsersDatabase.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error: Cannot open database")
        }
    }
    
    private func createTable() {
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Users(
        Id INTEGER PRIMARY KEY AUTOINCREMENT,
        Email TEXT,
        Password TEXT);
        """
        
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("User table created.")
            } else {
                print("Error: User table could not be created.")
            }
        } else {
            print("Error: Create table statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func registerUser(email: String, password: String) -> Bool {
        let insertStatementString = "INSERT INTO Users (Email, Password) VALUES (?, ?);"
        
        var insertStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully registered user.")
                sqlite3_finalize(insertStatement)
                return true
            } else {
                print("Error: Could not register user.")
            }
        } else {
            print("Error: Insert statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
        return false
    }
    
    func authenticateUser(email: String, password: String) -> Bool {
        let queryStatementString = "SELECT * FROM Users WHERE Email = ? AND Password = ?;"
        
        var queryStatement: OpaquePointer?
        var result = false
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(queryStatement, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(queryStatement, 2, (password as NSString).utf8String, -1, nil)
            
            if sqlite3_step(queryStatement) == SQLITE_ROW {
                result = true
            } else {
                result = false
            }
        } else {
            print("Error: Select statement could not be prepared.")
        }
        
        sqlite3_finalize(queryStatement)
        return result
    }
}
