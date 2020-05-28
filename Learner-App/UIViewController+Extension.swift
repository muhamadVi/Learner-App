//
//  UIViewController+Extension.swift
//  Learner-App
//
//  Created by Azam Mukhtar on 20/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    
    func getViewContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        return context
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func fillSubjectToCoreData() {
        
        print("GAK KE ISI")
        if (Subject.fetchAll(context: getViewContext()).isEmpty){ //cek apakah subject sudah terisi apa belum
        
        print("KE ISI")
        var subject : [Subject] = []
        //Subject 1
        let subject1 = Subject(context: getViewContext())
        subject1.subjectID = UUID().uuidString
        subject1.subjectName = "Intro to Linear Graphics"
        subject1.subjectLevel = "Beginner"
        subject1.subjectProgress = 0
        subject1.subjectStepCurrent = 1
        subject1.subjectStepTotal = 4
        
        let subject1Lesson1 = Lesson(context: getViewContext())
        subject1Lesson1.lesson = "Penjelasan2 Intro.png"//bentuknya html klo bisa
        subject1Lesson1.step = 1
        subject1.addToLessonRelationship(subject1Lesson1) // menambahkan lesson 1 untuk subject 1
        
        let subject1Lesson2 = Lesson(context: getViewContext())
        subject1Lesson2.lesson = "Penjelasan2 Intro2.png"//bentuknya html klo bisa
        subject1Lesson2.step = 3
        subject1.addToLessonRelationship(subject1Lesson2) // menambahkan lesson 2 untuk subject 1
            
        
        let subject1question1 = Question(context: getViewContext())
        subject1question1.question = "Exercise1 Intro.png"//bentuknya html klo bisa
        subject1question1.answer = "y = 3x + 3"
        subject1question1.step = 2
        subject1.addToQuestionRelationship(subject1question1) // menambahkan question 1 untuk subject 1
        
        let subject1question2 = Question(context: getViewContext())
              subject1question2.question = "Exercise2 intro.png"//bentuknya html klo bisa
              subject1question2.answer = "2x - 4y = 0"
              subject1question2.step = 4
              subject1.addToQuestionRelationship(subject1question2) // menambahkan question 2 untuk subject 1
        subject.append(subject1) //tambahkan subject 1 ke list
        //End of Subject 1
        
        //Subject 2
        let subject2 = Subject(context: getViewContext())
        subject2.subjectID = UUID().uuidString
        subject2.subjectName = "Gradients"
        subject2.subjectLevel = "Intermediate"
        subject2.subjectProgress = 0
        subject2.subjectStepCurrent = 1
        subject2.subjectStepTotal = 4
        
        let subject2Lesson1 = Lesson(context: getViewContext())
        subject2Lesson1.lesson = "Gradient formula1.png"//bentuknya html klo bisa
        subject2Lesson1.step = 1
        subject2.addToLessonRelationship(subject2Lesson1) // menambahkan lesson 1 untuk subject 1
        
        let subject2Lesson2 = Lesson(context: getViewContext())
        subject2Lesson2.lesson = "Gradien exp2.png"//bentuknya html klo bisa
        subject2Lesson2.step = 3
        subject2.addToLessonRelationship(subject2Lesson2) // menambahkan lesson 2 untuk subject 1
        
        let subject2question1 = Question(context: getViewContext())
        subject2question1.question = "Gradien exc1"//bentuknya html klo bisa
        subject2question1.answer = "m = 4/3"
        subject2question1.step = 2
        subject2.addToQuestionRelationship(subject2question1) // menambahkan question 1 untuk subject 2
        
       let subject2question2 = Question(context: getViewContext())
              subject2question2.question = "Gradien exc2.png"//bentuknya html klo bisa
              subject2question2.answer = "m = 0,5"
              subject2question2.step = 4
              subject2.addToQuestionRelationship(subject2question2) // menambahkan question 2 untuk subject 2
        
        subject.append(subject2) //tambahkan subject 1 ke list
        //End of Subject 2
            print(subject.count)
//        Subject.saveListSubject(context: getViewContext(), subjectList: subject) // save semua subject yang udah di tambahkan
        }
    }
    
    func fillCasesToCoreData(){
        var cases : [Cases] = []
        
        //Add cases rice
        let cases1 = Cases(context: getViewContext())
        cases1.casesID = UUID().uuidString
        cases1.casesTitle = "Car"
        
        cases.append(cases1)
        
        
        let cases2 = Cases(context: getViewContext())
        cases2.casesID = UUID().uuidString
        cases2.casesTitle = "Rice"
        
        cases.append(cases2)
        
        Cases.saveListCases(context: getViewContext(), casesList: cases)
    }
}
