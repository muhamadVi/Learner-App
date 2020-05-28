//
//  Case+Extension.swift
//  Learner-App
//
//  Created by Arif Rahman Sidik on 27/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import Foundation
import CoreData

extension Cases {

    static func saveCases(context : NSManagedObjectContext, cases: Cases) -> Cases? {
        var casesIn = Cases(context: context)
        casesIn = cases
        
        do {
            try context.save()
            return casesIn
        } catch {
            return nil
        }
    }
    
    
    static func saveListCases(context : NSManagedObjectContext, casesList : [Cases]) {
          for cases in casesList {
              let newCases = NSEntityDescription.insertNewObject(forEntityName: "Cases", into: context)
              newCases.setValue(cases.casesID, forKey: "casesID")
              newCases.setValue(cases.casesTitle, forKey: "casesTitle")
          }
        print(casesList)
          do {
              try context.save()
              print("Success")
          } catch {
              print("Error saving: \(error)")
          }
    }
    
    //Ambil data dari cases entity di core data
    static func fetchAllData(context : NSManagedObjectContext) -> [Cases] {
        let request: NSFetchRequest<Cases> = Cases.fetchRequest()
        //        let predicate = NSPredicate(format: "taskName BEGINSWITH 'm'")
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
        
    }
    
    
    //static func getDataEachById(context : NSManagedObjectContext, casesID : String) -> [Cases] {
      //  let request: NSFetchRequest<Cases> = Cases.fetchRequest()
      //  let predicate = NSPredicate(format: "casesID = %@", casesID)
      //  request.predicate = predicate
      //  do {
      //      return try context.fetch(request)
      //  } catch {
      //      return []
      //  }
    // }
}
