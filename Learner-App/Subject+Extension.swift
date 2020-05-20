//
//  Subject+Extension.swift
//  Learner-App
//
//  Created by Azam Mukhtar on 20/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import Foundation
import CoreData

extension Subject {
    
    static func saveSubject(context : NSManagedObjectContext, subject: Subject) -> Subject? {
        var subjectIn = Subject(context: context)
        subjectIn = subject
        
        //        guard ((try? context.save()) != nil) else {
        //            return nil
        //        }
        
        do {
            try context.save()
            return subjectIn
        } catch {
            return nil
        }
        
        //        return task
    }
    
    static func saveListSubject(context : NSManagedObjectContext, subjectList : [Subject]) {
          for subject in subjectList {
              let newSubject = NSEntityDescription.insertNewObject(forEntityName: "Subject", into: context)
              newSubject.setValue(subject.subjectID, forKey: "subjectID")
              newSubject.setValue(subject.subjectLevel, forKey: "subjectLevel")
              newSubject.setValue(subject.subjectName, forKey: "subjectName")
              newSubject.setValue(subject.subjectLevel, forKey: "subjectLevel")
              newSubject.setValue(subject.subjectStepCurrent, forKey: "subjectStepCurrent")
              newSubject.setValue(subject.subjectStepTotal, forKey: "subjectStepTotal")
          }
          do {
              try context.save()
              print("Success")
          } catch {
              print("Error saving: \(error)")
          }
    }
    
    static func updateSubject(context : NSManagedObjectContext, subjectID : String, progress: Int16, currentStep : Int16) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Subject")
        let predicate = NSPredicate(format: "subjectID = %@", subjectID)
        request.predicate = predicate
        let result = try? context.fetch(request)
            let resultData = result as! [Subject]
            for object in resultData {
                if object.subjectID == subjectID {
                    object.subjectProgress = progress
                    object.subjectStepCurrent = currentStep
                }
            }
            do {
                try context.save()
                print("saved!")
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
    }

    
    static func fetchAll(context : NSManagedObjectContext) -> [Subject] {
        let request: NSFetchRequest<Subject> = Subject.fetchRequest()
        //        let predicate = NSPredicate(format: "taskName BEGINSWITH 'm'")
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
        
    }
    
    
    static func getDataEachById(context : NSManagedObjectContext, subjectID : String) -> [Subject] {
        let request: NSFetchRequest<Subject> = Subject.fetchRequest()
        let predicate = NSPredicate(format: "subjectID = %@", subjectID)
        request.predicate = predicate
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
}



//    static func deleteAll(context : NSManagedObjectContext) {
//        let request: NSFetchRequest<NSFetchRequestResult> = Subject.fetchRequest()
////        let predicate = NSPredicate(format: "taskName BEGINSWITH 'm'")
////        request.predicate = predicate
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
//
//        try? context.execute(deleteRequest)
//    }
//}
