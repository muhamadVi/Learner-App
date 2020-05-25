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

class MiniDatabase {
    
    
    static func setIsFirstOpen(isFirstOpen : Bool){
        UserDefaults.standard.set(isFirstOpen, forKey: IS_FIRST_OPEN)
    }
    
    static func isFirstOpen() -> Bool {
        return UserDefaults.standard.bool(forKey: IS_FIRST_OPEN)
    }
    
    static func setLastProgressID(lastProgressID : Int){
        UserDefaults.standard.set(lastProgressID, forKey: IS_FIRST_OPEN)
    }
    
    static func getLastProgressID() -> Int {
        return UserDefaults.standard.integer(forKey: LAST_PROGRESS_ID_KEY)
    }
}
