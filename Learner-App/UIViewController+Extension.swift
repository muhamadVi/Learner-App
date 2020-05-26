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
    
    func fillSubjectToCoreData() {
        
        print("GAK KE ISI")
        if (Subject.fetchAll(context: getViewContext()).isEmpty){ //cek apakah subject sudah terisi apa belum
        
        print("KE ISI")
        var subject : [Subject] = []
        //Subject 1
        let subject1 = Subject(context: getViewContext())
        subject1.subjectID = UUID().uuidString
        subject1.subjectName = "Linear Intro"
        subject1.subjectLevel = "Beginner"
        subject1.subjectProgress = 0
        subject1.subjectStepCurrent = 1
        subject1.subjectStepTotal = 4
        
        let subject1Lesson1 = Lesson(context: getViewContext())
        subject1Lesson1.lesson = "Materi tentang linear"//bentuknya html klo bisa
        subject1Lesson1.step = 1
        subject1.addToLessonRelationship(subject1Lesson1) // menambahkan lesson 1 untuk subject 1
        
        let subject1Lesson2 = Lesson(context: getViewContext())
        subject1Lesson2.lesson = "Materi tentang linear Dua nih"//bentuknya html klo bisa
        subject1Lesson2.step = 3
        subject1.addToLessonRelationship(subject1Lesson2) // menambahkan lesson 2 untuk subject 1
        
        let subject1question1 = Question(context: getViewContext())
        subject1question1.question = "Linear adalah? "//bentuknya html klo bisa
        subject1question1.answer = "26+5=f"
        subject1question1.step = 2
        subject1.addToQuestionRelationship(subject1question1) // menambahkan question 1 untuk subject 1
        
        let subject1question2 = Question(context: getViewContext())
        subject1question2.question = "Linear adalah apa tuh hehe? "//bentuknya html klo bisa
        subject1question2.answer = "26+5=f"
        subject1question2.step = 4
        subject1.addToQuestionRelationship(subject1question2) // menambahkan question 2 untuk subject 1
        
        subject.append(subject1) //tambahkan subject 1 ke list
        //End of Subject 1
        
        //Subject 2
        let subject2 = Subject(context: getViewContext())
        subject2.subjectID = UUID().uuidString
        subject2.subjectName = "Linear Intro 2"
        subject2.subjectLevel = "Advance"
        subject2.subjectProgress = 0
        subject2.subjectStepCurrent = 1
        subject2.subjectStepTotal = 10
        
        let subject2Lesson1 = Lesson(context: getViewContext())
        subject2Lesson1.lesson = "Materi tentang linear subject 2"//bentuknya html klo bisa
        subject2Lesson1.step = 1
        subject2.addToLessonRelationship(subject1Lesson1) // menambahkan lesson 1 untuk subject 1
        
        let subject2Lesson2 = Lesson(context: getViewContext())
        subject2Lesson2.lesson = "Materi tentang linear Dua nih subject 2"//bentuknya html klo bisa
        subject2Lesson2.step = 2
        subject2.addToLessonRelationship(subject1Lesson2) // menambahkan lesson 2 untuk subject 1
        
        let subject2question1 = Question(context: getViewContext())
        subject2question1.question = "Linear adalah? subject 2"//bentuknya html klo bisa
        subject2question1.answer = "26+5=f subject 2"
        subject2question1.step = 1
        subject2.addToQuestionRelationship(subject1question1) // menambahkan question 1 untuk subject 1
        
        let subject2question2 = Question(context: getViewContext())
        subject2question2.question = "Linear adalah apa tuh hehe? subject 2"//bentuknya html klo bisa
        subject2question2.answer = "26+5=f subject 2"
        subject2question2.step = 2
        subject2.addToQuestionRelationship(subject1question2) // menambahkan question 2 untuk subject 1
        
        subject.append(subject2) //tambahkan subject 1 ke list
        //End of Subject 2
        
        
        Subject.saveListSubject(context: getViewContext(), subjectList: subject) // save semua subject yang udah di tambahkan
        }
    }
}
