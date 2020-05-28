//
//  CaseContent.swift
//  Learner-App
//
//  Created by Aldo on 26/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit

class CaseContent: UIViewController {
    
    @IBOutlet weak var graphImage: UIImageView!
    
    @IBOutlet weak var segmentType: UISegmentedControl!
    
    var titleCase = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        titleCase = MiniDatabase.getClickedCaseTitle()
        showNavigationBar()
        // Do any additional setup after loading the view.
        decideCase()
        setNavBar(title : titleCase)
    }
    
 
    
    func decideCase(){
        if titleCase == "Driver" {
            graphImage.image = #imageLiteral(resourceName: "car positive")
        } else if titleCase == "Farmer" {
            graphImage.image = #imageLiteral(resourceName: "rice positive")
        }
    }
    @IBAction func segmentTap(_ sender: Any) {
        
        let getIndex = segmentType.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            if titleCase == "Driver" {
                graphImage.image = #imageLiteral(resourceName: "car positive")
            } else if titleCase == "Farmer" {
                graphImage.image = #imageLiteral(resourceName: "rice positive")
            }
        case 1:
            if titleCase == "Driver" {
                graphImage.image = #imageLiteral(resourceName: "car negative")
            } else if titleCase == "Farmer" {
                graphImage.image = #imageLiteral(resourceName: "rice negative")
            }
        case 2:
            if titleCase == "Driver" {
                graphImage.image = #imageLiteral(resourceName: "car uncertain")
            } else if titleCase == "Farmer" {
                graphImage.image = #imageLiteral(resourceName: "rice uncertain")
            }
        default:
            if titleCase == "Driver" {
                graphImage.image = #imageLiteral(resourceName: "car positive")
            } else if titleCase == "Farmer" {
                graphImage.image = #imageLiteral(resourceName: "rice positive")
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        showNavigationBar()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
