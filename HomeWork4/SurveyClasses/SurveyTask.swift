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
    var orderedTask:ORKNavigableOrderedTask?
    var steps = [ORKStep]()
    
    
    
    
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

