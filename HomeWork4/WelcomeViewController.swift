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
