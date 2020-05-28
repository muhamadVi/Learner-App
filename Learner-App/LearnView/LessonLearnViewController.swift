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
    
    var stepTotal = 0
    var currentProgress = 0
    var setProgress = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        webkitLessonLearn()
        setLastProgress()
        showNavigationBar()
     
        
        
    }
    func setLastProgress(){
          let subjectID : String? = MiniDatabase.getLastProgressID()
          if subjectID != "nil" {
            //ambil data
            let subject = Subject.getDataEachById(context: getViewContext(), subjectID: subjectID!)
            
            currentProgress = Int(subject[0].subjectStepCurrent)
            stepTotal = Int(subject[0].subjectStepTotal)


            
            switch subject[0].subjectLevel {
            case "Beginner":
                
                beginner(subject: subject[0])
                print("masuk beginner")
                
            case "Intermediate":
                intermediate()
            
            default:
                print("nothing")
            }
            
            //updating progressview
//            updateProgressView()
          }
      }
    
//    func setQuestion(subject : Subject){
//        let question = subject.questionRelationship?.allObjects as! [Question]
//        for questionEach in question {
//            let step = questionEach.step
//            cekQuestion(step, que);
//        }
//        imageQuestion = question[0].answer
//    }
    
    func setLesson(subject : Subject){
        let lesson = subject.lessonRelationship?.allObjects as! [Lesson]
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
        lessonProgressView.transform = lessonProgressView.transform.scaledBy(x: 1, y: 5)
        totalStep.text = String(stepTotal)
        currentStep.text = String(currentProgress)
        setProgress = Int((Float(currentProgress) / Float(stepTotal)) * 100)
        
    
        lessonProgressView.progress = Float(Float(currentProgress)/10.0)
        
    
    }
    
    func beginner(subject : Subject) {
        let question = subject.questionRelationship?.allObjects as! [Question]
        let lesson = subject.lessonRelationship?.allObjects as! [Lesson]
        for questionEach in question {
            let step = questionEach.step
            print("ini step\(step)")
            
        }
        
        
        switch question[0].step {
        case 1:
            lesson1()
        case 2:
            lesson2()
        case 3:
            question1()
        default:
            print("Nothing")
        }
//        updateProgressView()
    }
    
    func intermediate() {
//        updateProgressView()
    }
    

    
    func lesson1() {

//        imageLesson.image = UIImage(named: subject[0].lesson)
    }
    
    func lesson2() {
//        imageLesson.image = UIImage(named: subject[0].lesson)
    }
    
    func question1() {
        
    }
    
    
    
    
    
//
//    func webkitLessonLearn() {
//        let html = """
//                    <div class="jumbotron text-center">
//                      <h1>My First Bootstrap Page</h1>
//                      <p>Resize this responsive page to see the effect!</p>
//                    </div>
//
//                    <div class="container">
//                      <div class="row">
//                        <div class="col-sm-4">
//                          <h3>Column 1</h3>
//                          <p>Lorem ipsum dolor..</p>
//                        </div>
//                        <div class="col-sm-4">
//                          <h3>Column 2</h3>
//                          <p>Lorem ipsum dolor..</p>
//                        </div>
//                        <div class="col-sm-4">
//                          <h3>Column 3</h3>
//                          <p>Lorem ipsum dolor..</p>
//                        </div>
//                      </div>
//                    </div>
//                    """
//        material.loadHTMLString(html, baseURL: nil)
//
//        let url = URL(string: "https://blog.ruangguru.com/matematika-kelas-8-cara-menentukan-persamaan-garis-lurus")
//        let request = URLRequest(url: url!)
        
//        material.load(html)
        
        
    }
    

