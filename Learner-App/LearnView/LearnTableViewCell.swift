//
//  LearnTableViewCell.swift
//  Learner-App
//
//  Created by Azam Mukhtar on 26/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit

class LearnTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelSubjectTitle: UILabel!
    @IBOutlet weak var labelSubjectLevel: UILabel!
    @IBOutlet weak var circleSubjectProgress: KDCircularProgress!
    @IBOutlet weak var viewSubjectBackground: UIView!
    @IBOutlet weak var labelSubjectProgress: UILabel!
    
    func changeColor(){
        switch labelSubjectLevel.text {
        case "Beginner":
            circleSubjectProgress.trackColor = #colorLiteral(red: 0.2156862745, green: 0.5529411765, blue: 0.2235294118, alpha: 0.16)
            circleSubjectProgress.progressColors[0] = #colorLiteral(red: 0.2156862745, green: 0.5529411765, blue: 0.2235294118, alpha: 1)
            viewSubjectBackground.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.5529411765, blue: 0.2235294118, alpha: 0.16)
        case "Intermediate":
            viewSubjectBackground.backgroundColor = #colorLiteral(red: 1, green: 0.8470588235, blue: 0.4, alpha: 0.3)
            circleSubjectProgress.trackColor = #colorLiteral(red: 1, green: 0.8470588235, blue: 0.4, alpha: 0.3)
            circleSubjectProgress.progressColors[0] = #colorLiteral(red: 1, green: 0.8470588235, blue: 0.4, alpha: 1)
        case "Advance":
            viewSubjectBackground.backgroundColor = #colorLiteral(red: 1, green: 0.4509803922, blue: 0.4, alpha: 0.3)
            circleSubjectProgress.trackColor = #colorLiteral(red: 1, green: 0.4509803922, blue: 0.4, alpha: 0.3)
            circleSubjectProgress.progressColors[0] = #colorLiteral(red: 1, green: 0.4509803922, blue: 0.4, alpha: 1)
        default:
            viewSubjectBackground.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.5529411765, blue: 0.2235294118, alpha: 0.16)
        }
    }
}
