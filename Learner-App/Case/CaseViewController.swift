//
//  CaseViewController.swift
//  Learner-App
//
//  Created by Arif Rahman Sidik on 27/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//

import UIKit

class CaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
   
    @IBOutlet weak var backgroundImageCase: UIImageView!
    @IBOutlet weak var labelCaseTitle: UILabel!
    @IBOutlet weak var imageViewCaseIcon: UIImageView!
    @IBOutlet weak var tableViewCaseContent: UITableView!
    
    
    var casesList: [Cases] = []
    var mCasesID = "nil"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromCoreData()
        fillCasesToCoreData()
        hideNavigationBar()
        
        
        //setupUI()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           if let cell = tableView.dequeueReusableCell(withIdentifier: "CaseTableViewCell", for: indexPath) as? CaseTableViewCell {
               let cases = casesList[indexPath.row]
               cell.labelTitleCase.text = cases.casesTitle
               cell.changeViewCell()
               return cell
           }
           return CaseTableViewCell()
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let cases = casesList[indexPath.row]
           performSegue(withIdentifier: "toCasesContent", sender: cases)
           MiniDatabase.setClickedCaseTitle(title: cases.casesTitle ?? "nil")
       }
    
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
        
    }
    
    func getDataFromCoreData(){
        casesList = Cases.fetchAllData(context: getViewContext())
        tableViewConfig()
        print("case view\(casesList)")
        tableViewConfig()
    }
    
    func tableViewConfig(){
        tableViewCaseContent.dataSource = self
        tableViewCaseContent.delegate = self
        tableViewCaseContent.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return casesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
