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
    
    
    
    let stepTotal = 0.8  //subjectStepTotal
    var currentProgress = 0.0 //subjectStepCurrent
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webkitLessonLearn()
        
        self.lessonProgressView.progress = Float(currentProgress)
        self.perform(#selector(updateProgressView), with: nil, afterDelay: 1)
        
        // Do any additional setup after loading the view.
        
        
    }
    @IBAction func nextLesson(_ sender: Any) {
        
        self.performSegue(withIdentifier: "toNextLesson", sender: nil)
    }
    

    @objc func updateProgressView() {
        currentProgress = currentProgress + 0.2
        self.lessonProgressView.progress = Float(currentProgress)
        totalStep.text = "\(Int(stepTotal * 10))"
        
        if currentProgress != stepTotal {
            self.perform(#selector(updateProgressView), with: nil, afterDelay: 1)
            currentStep.text = "\(Int(currentProgress * 10))"
        }
    }
    
 
    func webkitLessonLearn () {
        let url = URL(string: "https://blog.ruangguru.com/matematika-kelas-8-cara-menentukan-persamaan-garis-lurus")
        let request = URLRequest(url: url!)
        
        material.load(request)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toNextLesson" {
//
//        }
//
//    }
   
}
