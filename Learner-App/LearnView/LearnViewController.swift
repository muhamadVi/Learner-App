//
//  LearnViewController.swift
//  Learner-App
//
//  Created by Azam Mukhtar on 25/05/20.
//  Copyright © 2020 Muhamad Vicky. All rights reserved.
//
import UIKit

class LearnViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var viewLastProgress: UIView!
    @IBOutlet weak var learnTableView: UITableView!
    @IBOutlet weak var labelLastProgressSubject: UILabel!
    @IBOutlet weak var labelLastProgressLevel: UILabel!
    
    var subjectList: [Subject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        fillSubjectToCoreData()
        setLastProgress()
        getDataFromCoreData()
        initOnClickLastProgress()
    }
    
    func initOnClickLastProgress(){
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onLastProgressClicked))
        viewLastProgress.addGestureRecognizer(gesture)
    }
    
    func getDataFromCoreData(){
        subjectList = Subject.fetchAll(context: getViewContext())
        tableViewConfig()
    }
    
    @objc func onLastProgressClicked(sender : UITapGestureRecognizer) {
          performSegue(withIdentifier: "toDetailPage", sender: nil)
    }
    
    func tableViewConfig(){
        learnTableView.dataSource = self
        learnTableView.delegate = self
        learnTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    func setLastProgress(){
        let subjectID : String? = MiniDatabase.getLastProgressID()
        if subjectID != "nil" {
            let subject = Subject.getDataEachById(context: getViewContext(), subjectID: subjectID!)
            labelLastProgressSubject.text = subject[0].subjectName
            labelLastProgressLevel.text = subject[0].subjectLevel
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "LearnTableViewCell", for: indexPath) as? LearnTableViewCell {
            let subject = subjectList[indexPath.row]
            cell.labelSubjectLevel.text = subject.subjectLevel
            cell.labelSubjectTitle.text = subject.subjectName
            cell.labelSubjectProgress.text = "\(subject.subjectProgress)%"
            cell.circleSubjectProgress.angle = changePercentToDegree(percent: Double(subject.subjectProgress))
                  //persen/100 * 360 ini jadi degree
            return cell
        }
        return LearnTableViewCell()
    }
    
    func changePercentToDegree(percent : Double) -> Double{
        return percent/100 * 360
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let subject = subjectList[indexPath.row]
        performSegue(withIdentifier: "toDetailPage", sender: subject)
        MiniDatabase.setLastProgressID(lastProgressID: subject.subjectID ?? "nil")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setLastProgress()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let destination = segue.destination as? DetailPage {
//            destination.recipe = sender as? Recipe
//        }
//    }
}

