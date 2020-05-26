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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentTap(_ sender: Any) {
        
        let getIndex = segmentType.selectedSegmentIndex
        print(getIndex)
        
        switch (getIndex) {
        case 0:
            graphImage.image = #imageLiteral(resourceName: "panen pos")
        case 1:
            graphImage.image = #imageLiteral(resourceName: "panen neg")
        case 2:
            graphImage.image = #imageLiteral(resourceName: "panen tak")
        default:
            graphImage.image = #imageLiteral(resourceName: "panen pos")
        }
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
