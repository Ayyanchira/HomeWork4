//
//  SurveyTask.swift
//  HomeWork4
//
//  Created by Akshay Ayyanchira on 11/7/17.
//  Copyright © 2017 Akshay Ayyanchira. All rights reserved.
//

import Foundation
import ResearchKit

class SurveyTask: NSObject {
    
    let questions = SurveyData();
    var orderedTask:ORKNavigableOrderedTask?
    var steps = [ORKStep]()
    
    func getOrderedTasksWithRules() -> ORKNavigableOrderedTask {
        
        // PRAGMA MARK: Defining answer formats
        let answerFormatYesOrNo = ORKBooleanAnswerFormat()
        let answerFormatSelection = ORKScaleAnswerFormat(maximumValue: 7, minimumValue: 0, defaultValue: 0, step: 1)
        
        // PARGMA MARK: Fetching and appending questions from File/Class
//        let genericQuestionOne = questions.questionSetOne["1"];
//        let questionOneStep = ORKQuestionStep(identifier: "questionSet1-", title: genericQuestionOne , answer: answerFormatYesOrNo)
//        steps += [questionOneStep]
//
//        let genericQuestionTwo = questions.questionSetOne["2"];
//        let questionTwoStep = ORKQuestionStep(identifier: "questionSet1-", title: genericQuestionTwo , answer: answerFormatYesOrNo)
//        steps += [questionTwoStep]
        
        for i in 1...questions.questionSetOne.count{
            let questionStep = ORKQuestionStep(identifier: "questionSet1-\(i)", title: questions.questionSetOne["\(i)"], answer: answerFormatYesOrNo)
            steps += [questionStep]
        }
        
        for i in 1...questions.questionSetTwo.count{
            let questionStep = ORKQuestionStep(identifier: "questionSet2-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetTwo["\(i)"], answer: answerFormatSelection)
            steps += [questionStep]
        }
        
        for i in 1...questions.questionSetThree.count{
            let questionStep = ORKQuestionStep(identifier: "questionSet3-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetThree["\(i)"], answer: answerFormatSelection)
            steps += [questionStep]
        }
        
        
        // TODO: Add Third type of questions
        
        let completionStep = ORKCompletionStep(identifier: "SummaryStep")
        completionStep.title = "Thank you for your time!"
        completionStep.text = "Your participation is very important to us."
        steps += [completionStep]
        orderedTask = ORKNavigableOrderedTask(identifier: "survey1", steps: steps)
        
        
        // PRAGMA MARK: Set rules for ORKNavigableOrdered Task
        var predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "questionSet1-1"), expectedAnswer: true)
        let ruleOne = ORKPredicateStepNavigationRule(resultPredicates: [predicate], destinationStepIdentifiers: ["questionSet1-2"], defaultStepIdentifier: "questionSet3-1", validateArrays: true)
        
        predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "questionSet1-2"), expectedAnswer: true)
        let ruleTwo = ORKPredicateStepNavigationRule(resultPredicates: [predicate], destinationStepIdentifiers: ["questionSet2-1"], defaultStepIdentifier: "questionSet3-1", validateArrays: true)
        
        orderedTask?.setNavigationRule(ruleOne, forTriggerStepIdentifier: "questionSet1-1")
        orderedTask?.setNavigationRule(ruleTwo, forTriggerStepIdentifier: "questionSet1-2")
        
        return orderedTask!
    }
    
}
//public var SurveyTask:NSObject{
//
//    var orderedTask:ORKNavigableOrderedTask
//
//    var steps = [ORKStep]()
//
//    //Text Input Question
//    let daysCountAnswer = ORKScaleAnswerFormat(maximumValue: 7, minimumValue: 0, defaultValue: 4, step: 1)
//    let alcoholQuestionStepTitle = "How many days you had alcohol this week?"
//    let alcoholQuestionStep = ORKQuestionStep(identifier: "AlcoholStep", title: alcoholQuestionStepTitle, answer: daysCountAnswer)
//    steps += [alcoholQuestionStep]
//
//
//
//
//
//    return ORKNavigableOrderedTask(identifier: "surveyOne", steps: steps)
//}

