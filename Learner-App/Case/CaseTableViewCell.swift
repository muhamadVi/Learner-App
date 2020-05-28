//
//  CaseTableViewCell.swift
//  Learner-App
//
//  Created by Arif Rahman Sidik on 28/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit

class CaseTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewCase: UIImageView!
    @IBOutlet weak var labelTitleCase: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    var cases: [Cases] = []
    
    func changeViewCell(){
        switch labelTitleCase.text {
        case "Driver":
             viewBackground.backgroundColor = #colorLiteral(red: 0.5699979663, green: 0.6050838232, blue: 0.6172596812, alpha: 1)
             imageViewCase.image = #imageLiteral(resourceName: "Car")
             viewBackground.layer.cornerRadius = 10.0
        case "Farmer":
             viewBackground.backgroundColor = #colorLiteral(red: 0, green: 0.83900249, blue: 1, alpha: 1)
             imageViewCase.image = #imageLiteral(resourceName: "rice")
             viewBackground.layer.cornerRadius = 10.0
        default:
             viewBackground.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
             viewBackground.layer.cornerRadius = 10.0
        }
    }
}
