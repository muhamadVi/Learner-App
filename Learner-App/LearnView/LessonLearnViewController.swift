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
    
    let maxTime : Int = 3
    var currentProgress : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lessonProgress()
        webkitLessonLearn()
        
        // Do any additional setup after loading the view.
        
        
    }
    
    func lessonProgress() {
        lessonProgressView.setProgress(Float(currentProgress), animated: true)
        perform(#selector(updateProgress), with: nil, afterDelay:  1.0)
    }
    
    @objc func updateProgress() {
        currentProgress = currentProgress + 1
        lessonProgressView.progress = Float(currentProgress/maxTime)
        currentStep.text = "\(currentProgress)"
        
        if currentProgress < maxTime {
            perform(#selector(updateProgress), with: nil, afterDelay:  1.0)
        } else {
            currentProgress = 0
        }
    }
    
    func webkitLessonLearn () {
        let url = URL(string: "https://blog.ruangguru.com/matematika-kelas-8-cara-menentukan-persamaan-garis-lurus")
        let request = URLRequest(url: url!)
        
        material.load(request)
    }
   
}
