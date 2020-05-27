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
    @IBOutlet weak var material: WKWebView!
    
    
    var stepTotal = 0  //subjectStepTotal
//    let coba = subje
    var currentProgress = 0 //subjectStepCurrent + 2
    var setProgress = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webkitLessonLearn()
        setLastProgress()
        showNavigationBar()
     //self.lessonProgressView.progress = Float(currentProgress)
     //self.perform(#selector(updateProgressView), with: nil, afterDelay: 1)
        
        
    }
    func setLastProgress(){
          let subjectID : String? = MiniDatabase.getLastProgressID()
          if subjectID != "nil" {
            
            let subject = Subject.getDataEachById(context: getViewContext(), subjectID: subjectID!)
            print(" ini hasil dari vicky\(subject)")
//            currentProgress = Double(subject[0].subjectStepCurrent)
//            print(currentProgress)
//              labelLastProgressSubject.text = subject[0].subjectName
//              labelLastProgressLevel.text = subject[0].subjectLevel
//            var question = subject[0]
            
            currentProgress = Int(subject[0].subjectStepCurrent)
            //currentProgress = 1
            stepTotal = Int(subject[0].subjectStepTotal)
            //setProgress = Int(subject[0].subjectProgress)
            updateProgressView()
          }
      }
    @IBAction func nextLesson(_ sender: Any) {
        if (currentProgress != stepTotal) {
            currentProgress = currentProgress + 1
            updateProgressView()
            Subject.updateSubject(context: getViewContext(), subjectID: MiniDatabase.getLastProgressID(), progress: Int16(setProgress), currentStep: Int16(currentProgress))
        }
    }

    func updateProgressView() {
        totalStep.text = String(stepTotal)
        currentStep.text = String(currentProgress)
        setProgress = Int((Float(currentProgress) / Float(stepTotal)) * 100)
        
    
        lessonProgressView.progress = Float(Float(currentProgress)/10.0)
        
        print(Float(currentProgress/10))
    
            //lessonProgressView.setProgress(Float(currentProgress), animated: true)
        
        
        
//        setProgress = setProgress + 0.2
//        self.lessonProgressView.progress = Float(setProgress)
//        totalStep.text = "\(Int(stepTotal * 10))"
//
//        if setProgress != currentProgress {
//            self.perform(#selector(updateProgressView), with: nil, afterDelay: 1)
//            currentStep.text = "\(Int(setProgress * 10))"
//        }
    }
    
    func webkitLessonLearn () {
        let url = URL(string: "https://blog.ruangguru.com/matematika-kelas-8-cara-menentukan-persamaan-garis-lurus")
        let request = URLRequest(url: url!)
        
        material.load(request)
    }
}
