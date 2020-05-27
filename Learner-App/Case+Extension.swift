//
//  Case+Extension.swift
//  Learner-App
//
//  Created by Arif Rahman Sidik on 27/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import Foundation
import CoreData

extension Case {

    static func saveCase(context : NSManagedObjectContext, caseContent: Case) -> Case? {
        var caseIn = Case(context: context)
        caseIn = caseContent
        
        do {
            try context.save()
            return caseIn
        } catch {
            return nil
        }
    }
}
