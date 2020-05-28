//
//  MiniDatabase.swift
//  Learner-App
//
//  Created by Azam Mukhtar on 20/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import Foundation


let IS_FIRST_OPEN = "IS_FIRST_OPEN"
let LAST_PROGRESS_ID_KEY = "LAST_PROGRESS_ID_KEY"
let CLICKED_CASE_ID_KEY = "CLICKED_CASE_ID_KEY"

class MiniDatabase {
    
    
    static func setIsFirstOpen(isFirstOpen : Bool){
        UserDefaults.standard.set(isFirstOpen, forKey: IS_FIRST_OPEN)
    }
    
    static func isFirstOpen() -> Bool {
        return UserDefaults.standard.bool(forKey: IS_FIRST_OPEN)
    }
    
    static func setLastProgressID(lastProgressID : String){
        UserDefaults.standard.set(lastProgressID, forKey: LAST_PROGRESS_ID_KEY)
    }
    
    static func getLastProgressID() -> String {
        return UserDefaults.standard.string(forKey: LAST_PROGRESS_ID_KEY) ?? "nil"
    }
    
    static func setClickedCaseTitle(title : String){
        UserDefaults.standard.set(title, forKey: CLICKED_CASE_ID_KEY)
    }
    
    static func getClickedCaseTitle() -> String {
        return UserDefaults.standard.string(forKey: CLICKED_CASE_ID_KEY) ?? "nil"
    }
}
