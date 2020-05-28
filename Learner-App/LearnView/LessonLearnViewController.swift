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
    
    
    var stepTotal = 0
    var currentProgress = 0
    var setProgress = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webkitLessonLearn()
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
        setProgress = Int((Float(currentProgress) / Float(stepTotal)) * 100)
        
    
        lessonProgressView.progress = Float(Float(currentProgress)/10.0)
        
    
    }
    
//    func checkLessonOrQUestion() {
//
//
//        switch <#value#> {
//        case <#pattern#>:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
    func webkitLessonLearn() {
        let html = """
                    <div class="jumbotron text-center">
                      <h1>My First Bootstrap Page</h1>
                      <p>Resize this responsive page to see the effect!</p>
                    </div>

                    <div class="container">
                      <div class="row">
                        <div class="col-sm-4">
                          <h3>Column 1</h3>
                          <p>Lorem ipsum dolor..</p>
                        </div>
                        <div class="col-sm-4">
                          <h3>Column 2</h3>
                          <p>Lorem ipsum dolor..</p>
                        </div>
                        <div class="col-sm-4">
                          <h3>Column 3</h3>
                          <p>Lorem ipsum dolor..</p>
                        </div>
                      </div>
                    </div>
                    """
        material.loadHTMLString(html, baseURL: nil)
        
//        let url = URL(string: "https://blog.ruangguru.com/matematika-kelas-8-cara-menentukan-persamaan-garis-lurus")
//        let request = URLRequest(url: url!)
        
//        material.load(html)
        
        
    }
    
//    func lesson() {
//        <#function body#>
//    }
}
