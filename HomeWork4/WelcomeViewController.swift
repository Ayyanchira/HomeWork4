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
    @IBOutlet weak var startButton: UIButton!
    var username:String?
//    var token:String = {
//        return UserDefaults.standard.object(forKey: "token") as! String
//    }()
    
    var scoreMedication:Int = 0
    var scoreDiet:Int = 0
    var scorePhysical:Int = 0
    var scoreSmoking:Int = 0
    var scoreWeight:Int = 0
    var scoreAlcohol:Int = 0
    
    var token = "SOMERANDOMTOKENGENERATED>PLEASECOMMENTTHISLINEANDUSEABOVEMETHOD"
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
        //var surveyResult = [String:Any]()
        if reason == ORKTaskViewControllerFinishReason.discarded || reason == ORKTaskViewControllerFinishReason.failed{
            taskViewController.dismiss(animated: true, completion: nil)
            return
        }
        let question = SurveyData()
//        for question in question.questionSetOne {
//            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet1-\(question.key)"){
//                var results = stepResult.results
//                let booleanAnswer = results![0] as! ORKBooleanQuestionResult
//                if let answer = booleanAnswer.booleanAnswer as? Int{
//                    surveyResult[question.value] = answer
//                }
//
//            }
//        }
//
//        for question in question.questionSetTwo {
//            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet2-\(question.key)"){
//                var results = stepResult.results
//                let scaleAnswer = results![0] as! ORKScaleQuestionResult
//                if let answer = scaleAnswer.scaleAnswer as? Int{
//                    surveyResult[question.value] = "\(answer) days a week"
//                }
//            }
//        }
//
//        for question in question.questionSetThree {
//            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet3-\(question.key)"){
//                var results = stepResult.results
//                let scaleAnswer = results![0] as! ORKScaleQuestionResult
//                if let answer = scaleAnswer.scaleAnswer as? Int{
//                    surveyResult[question.value] = "\(answer) days a week"
//                }
//            }
//        }
        var surveyResult:String = ""
        for question in question.questionSetOne {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet1-\(question.key)"){
                var results = stepResult.results
                let booleanAnswer = results![0] as! ORKBooleanQuestionResult
                if let answer = booleanAnswer.booleanAnswer as? Int{
                    surveyResult.append("%\(question.value)#\(answer)")
                }else{
                    surveyResult.append("%\(question.value)#NA")
                }
                
            }
        }
        
        for question in question.questionSetTwo {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet2-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult.append("%\(question.value)#\(answer) days a week")
                    scoreMedication += answer
                }
                else{
                    surveyResult.append("%\(question.value)#NA")
                }
            }
        }
        
        for question in question.questionSetThree {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet3-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult.append("%\(question.value)#\(answer) days a week")
                    scoreDiet += answer
                }else{
                    surveyResult.append("%\(question.value)#NA")
                }
            }
        }
        
        for question in question.questionSetFour{
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet4-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult.append("%\(question.value)#\(answer) days a week")
                    if question.key == "1" || question.key == "2"{
                        scorePhysical += answer
                    }
                }else{
                    surveyResult.append("%\(question.value)#NA")
                }
            }
        }
        
        for question in question.questionSetFive {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet5-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKScaleQuestionResult
                if let answer = scaleAnswer.scaleAnswer as? Int{
                    surveyResult.append("%\(question.value)#\(answer) days a week")
                    scoreSmoking += answer
                }else{
                    surveyResult.append("%\(question.value)#NA")
                }
            }
        }
        
        for question in question.questionSetSix {
            if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet6-\(question.key)"){
                var results = stepResult.results
                let scaleAnswer = results![0] as! ORKChoiceQuestionResult
                if let answer = scaleAnswer.choiceAnswers{
                    surveyResult.append("%\(question.value)#I think I \(answer[0])")
                    scoreWeight += answer[0] as! Int
                }else{
                    surveyResult.append("%\(question.value)#NA")
                }
            }
        }
        
        for question in question.questionSetSeven {
            var perWeekCount = 0
            if question.key == "1"{
                if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet7-\(question.key)"){
                    var results = stepResult.results
                    let scaleAnswer = results![0] as! ORKScaleQuestionResult
                    if let answer = scaleAnswer.scaleAnswer as? Int{
                        surveyResult.append("%\(question.value)#\(answer) days a week")
                        perWeekCount = answer
                    }else{
                        surveyResult.append("%\(question.value)#NA")
                    }
                }
            }
            else{
                if let stepResult = taskViewController.result.stepResult(forStepIdentifier: "questionSet7-\(question.key)"){
                    var results = stepResult.results
                    let scaleAnswer = results![0] as! ORKNumericQuestionResult
                    if let answer = scaleAnswer.numericAnswer as? Int{
                        surveyResult.append("%\(question.value)#\(answer) drinks")
                        if question.key == "2"{
                            let drinksPerDay = answer
                            scoreAlcohol = perWeekCount * drinksPerDay
                        }
                    }else{
                        surveyResult.append("%\(question.value)#NA")
                    }
                }
            }
            
        }
        
        surveyResult.append("**&&MedicationScore:\(scoreMedication),&&DietScore:\(scoreDiet),&&PhysicalActivityScore:\(scorePhysical),&&SmokingScore:\(scoreSmoking),&&WeightManagementScore:\(scoreWeight),&&AlcoholScore:\(scoreAlcohol)**")
        //let jsonData = surveyResult.description
        
        submitSurvey(surveyJson: surveyResult)
        
        taskViewController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startSurveyPressed(_ sender: UIButton) {
        let surveyTask = SurveyTask()
        let taskViewController = ORKTaskViewController(task: surveyTask.getOrderedTasksWithRules(), taskRun: nil)
        taskViewController.delegate = self
        present(taskViewController, animated: true, completion: nil)
    }
    
    
    func submitSurvey(surveyJson:String) {
        let headers = [
            "content-type": "application/json",
            "cache-control": "no-cache",
            "postman-token": "3d707e3c-8e23-d7fc-1072-25053af7fee1"
        ]
        let parameters = [
            "email": "whyDoWeNeedThis@gmail.com?",
            "survey": surveyJson,
            "token": token
            ] as [String : Any]
        
        let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://13.58.162.202:5000/surveyapi")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data!
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                let dict = self.convertToDictionary(text: String(datastring))
                
                if let statusCode = dict?["code"] as! Int?{
                    DispatchQueue.main.async {
                        if statusCode == 200{
                            print("Survey Submitted")
                            self.startButton.isEnabled = false
                            self.startButton.setTitle("Completed", for: UIControlState.disabled)
                        }
                        else if statusCode == 400{
                            let alert = UIAlertController(title: "Failed", message: "OOPS! Somethign went wrong!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler:nil))
                            self.present(alert, animated: true, completion: nil)
                        }
                    }
                    
                }
                
                print(datastring)
            }
        })
        
        dataTask.resume()
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
