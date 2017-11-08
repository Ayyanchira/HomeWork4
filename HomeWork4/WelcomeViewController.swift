//
//  WelcomeViewController.swift
//  HomeWork4
//
//  Created by Akshay Ayyanchira on 11/7/17.
//  Copyright © 2017 Akshay Ayyanchira. All rights reserved.
//

import UIKit
import ResearchKit

class WelcomeViewController: UIViewController, ORKTaskViewControllerDelegate {

    @IBOutlet var welcomeLabel: UILabel!
    var username:String?
    var token:String = {
        return UserDefaults.standard.object(forKey: "token") as! String
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome \(username!),\nHow are you?\nReady for a quick survey?"
        
        print("Token fetched is \(token)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func taskViewController(_ taskViewController: ORKTaskViewController, didFinishWith reason: ORKTaskViewControllerFinishReason, error: Error?) {
        
        //fetching question class to get question
        var surveyResult = [String:Any]()
        
        let question = SurveyData()
        for question in question.questionSetOne {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet1-\(question.key)"){
                var results = stepResult.results
                let booleanAnswer = results![0] as! ORKBooleanQuestionResult
                if let answer = booleanAnswer.booleanAnswer as? Int{
                    surveyResult[question.value] = answer
                }
                
            }
        }
        
        for question in question.questionSetTwo {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet2-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult[question.value] = "\(answer) days a week"
                }
            }
        }
        
        for question in question.questionSetThree {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet3-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult[question.value] = "\(answer) days a week"
                }
            }
        }
        
//        let jsonData = surveyResult.description
//        let ofProtocol = jsonData.replacingOccurrences(of: \, with: "")
//
//        jsonData = jsonData.replacingOccurrences(of: <#T##StringProtocol#>, with: <#T##StringProtocol#>)
        
        
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startSurveyPressed(_ sender: UIButton) {
        let surveyTask = SurveyTask()
        let taskViewController = ORKTaskViewController(task: surveyTask.getOrderedTasksWithRules(), taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
