//
//  CaseTableViewCell.swift
//  Learner-App
//
//  Created by Arif Rahman Sidik on 27/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit

class CaseTableViewCell: UITableViewCell {
    @IBOutlet weak var LabelTitleCaseContent: UILabel!
    @IBOutlet weak var ImageViewCaseContent: UIImageView!
    @IBOutlet weak var CaseTableView: CaseTableViewCell!
    
    var cases: [Cases]? {
        didSet {
            changeViewCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
     func changeViewCell(){
           switch LabelTitleCaseContent.text {
           case "Car":
                CaseTableView.backgroundColor = #colorLiteral(red: 0.5699979663, green: 0.6050838232, blue: 0.6172596812, alpha: 1)
                ImageViewCaseContent.image = #imageLiteral(resourceName: "Car")
           case "Rice":
                CaseTableView.backgroundColor = #colorLiteral(red: 0, green: 0.83900249, blue: 1, alpha: 1)
                ImageViewCaseContent.image = #imageLiteral(resourceName: "rice")
           default:
                CaseTableView.backgroundColor = #colorLiteral(red: 0.2156862745, green: 0.5529411765, blue: 0.2235294118, alpha: 0.16)
           }
       }

}
