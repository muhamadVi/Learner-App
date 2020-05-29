//
//  LessonLearnViewController.swift
//  Learner-App
//
//  Created by Muhamad Vicky on 26/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit
import WebKit

class LessonLearnViewController: UIViewController {
    
    @IBOutlet weak var currentStep: UILabel!
    @IBOutlet weak var totalStep: UILabel!
    @IBOutlet weak var lessonProgressView: UIProgressView!
    @IBOutlet weak var imageLesson: UIImageView!
    
    @IBOutlet weak var statusAnswer: UIImageView!
    @IBOutlet weak var textFieldAnswer: UITextField!
    @IBOutlet weak var imageQuestion: UIImageView!
    
    @IBOutlet weak var btnSubmitQuestion: UIButton!
    @IBOutlet weak var btnPrevious: UIButton!
    
    var answerFromTheQuestion = ""
    
    var stepTotal = 0
    var currentProgress = 0
    var setProgress = 0
    
    var mSubject : Subject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        webkitLessonLearn()
        setLastProgress()
        showNavigationBar()
        

    }
    @IBAction func btnSubmit(_ sender: Any) {
        if textFieldAnswer.text == answerFromTheQuestion {
            statusAnswer.isHidden = false
            print("masuk if true")
            statusAnswer.image = #imageLiteral(resourceName: "correct")
            
            
        } else {
            statusAnswer.image = #imageLiteral(resourceName: "wrong")
            print("masuk false")
            statusAnswer.isHidden = false
            
        }
    }
    
    
    @IBAction func Previous(_ sender: Any) {
        print("clicked\(currentProgress)")
        if (currentProgress != stepTotal) {
            currentProgress = currentProgress - 1
            print("isi \(currentProgress)")
            updateProgressView()
            Subject.updateSubject(context: getViewContext(), subjectID: MiniDatabase.getLastProgressID(), progress: Int16(setProgress), currentStep: Int16(currentProgress))
            
            setLastProgress()
        }
    }
    
    
    func setLastProgress(){
        let subjectID : String? = MiniDatabase.getLastProgressID()
        if subjectID != "nil" {
            //ambil data
            let subject = Subject.getDataEachById(context: getViewContext(), subjectID: subjectID!)
            
            currentProgress = Int(subject[0].subjectStepCurrent)
            stepTotal = Int(subject[0].subjectStepTotal)
            
            mSubject = subject[0]
            
            

            setNavBar(title: String(subject[0].subjectName!))
            //updating progressview
            updateProgressView()
        }
    }
    

    
    
    @IBAction func nextLesson(_ sender: Any) {
        if (currentProgress != stepTotal) {
            currentProgress = currentProgress + 1
            updateProgressView()
            Subject.updateSubject(context: getViewContext(), subjectID: MiniDatabase.getLastProgressID(), progress: Int16(setProgress), currentStep: Int16(currentProgress))
            
            setLastProgress()
        }
    }
    
    func updateProgressView() {

        totalStep.text = String(stepTotal)
        currentStep.text = String(currentProgress)
        print("update \(currentProgress)")
        setProgress = Int((Float(currentProgress) / Float(stepTotal)) * 100)
        
        
        lessonProgressView.progress = Float(Float(currentProgress)/Float(stepTotal))
         decideQuestionOrLesson(subject : mSubject!)
        
    }
    
    func decideQuestionOrLesson(subject : Subject) {
        let question = subject.questionRelationship?.allObjects as! [Question]
        let lesson = subject.lessonRelationship?.allObjects as! [Lesson]
        for lessonEach in lesson {
            
            if lessonEach.step == currentProgress {
                setLesson(lessonParam: lessonEach)
            } else {
                for questionEach in question {
                    if questionEach.step == currentProgress {
                        setQuestion(questionParam : questionEach)
                    }
                }
            }
            
        }
        
        
        
    }
    
      func setQuestion(questionParam : Question) {

        imageQuestion.image = UIImage(named: questionParam.question ?? "")
        
        answerFromTheQuestion = questionParam.answer ?? ""
        
        imageQuestion.isHidden = false
        textFieldAnswer.isHidden = false
        statusAnswer.isHidden = false
        btnSubmitQuestion.isHidden = false
        
        statusAnswer.isHidden = true
        
        imageLesson.isHidden = true
            
            
        }
        
        func setLesson(lessonParam : Lesson) {

            imageLesson.image = UIImage(named: lessonParam.lesson ?? "")
            
            imageLesson.isHidden = false
            textFieldAnswer.isHidden = true
            statusAnswer.isHidden = true
            btnSubmitQuestion.isHidden = true
            
            statusAnswer.isHidden = true
                       
            imageQuestion.isHidden = true
        }
    
 
    
    
    
    
    
    
    
    
}


