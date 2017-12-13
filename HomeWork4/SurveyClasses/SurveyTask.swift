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
    
    
//    func getOrderedTasksWithRules() -> ORKNavigableOrderedTask {
//
//        // PRAGMA MARK: Defining answer formats
//        let answerFormatYesOrNo = ORKBooleanAnswerFormat()
//        let answerFormatSelection = ORKScaleAnswerFormat(maximumValue: 7, minimumValue: 0, defaultValue: 0, step: 1)
//
//        let orkTextChoices1 = ORKTextChoice(text: "Strongly Disagree", detailText: nil, value: 1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
//        let orkTextChoices2 = ORKTextChoice(text: "Disagree", detailText: nil, value: 2 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
//        let orkTextChoices3 = ORKTextChoice(text: "Not Sure", detailText: nil, value: 3 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
//        let orkTextChoices4 = ORKTextChoice(text: "Agree", detailText: nil, value: 4 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
//        let orkTextChoices5 = ORKTextChoice(text: "Strongly Agree", detailText: nil, value: 5 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
//        let answerFormatAgreeDisagree = ORKTextScaleAnswerFormat(textChoices: [orkTextChoices1,orkTextChoices2,orkTextChoices3,orkTextChoices4,orkTextChoices5], defaultIndex: 2)
//
//
//        let answerFormatTextInput = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.integer)
//
//        // PARGMA MARK: Fetching and appending questions from File/Class
////        let genericQuestionOne = questions.questionSetOne["1"];
////        let questionOneStep = ORKQuestionStep(identifier: "questionSet1-", title: genericQuestionOne , answer: answerFormatYesOrNo)
////        steps += [questionOneStep]
////
////        let genericQuestionTwo = questions.questionSetOne["2"];
////        let questionTwoStep = ORKQuestionStep(identifier: "questionSet1-", title: genericQuestionTwo , answer: answerFormatYesOrNo)
////        steps += [questionTwoStep]
//
//        //General
//        for i in 1...questions.questionSetOne.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet1-\(i)", title: questions.questionSetOne["\(i)"], answer: answerFormatYesOrNo)
//            steps += [questionStep]
//        }
//
//        //Medication
//        for i in 1...questions.questionSetTwo.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet2-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetTwo["\(i)"], answer: answerFormatSelection)
//            steps += [questionStep]
//        }
//
//        let instructionStepHealth = ORKInstructionStep(identifier: "medicationIntro")
//        instructionStepHealth.title = "The following questions ask about your health behavior activities during the past 7 days."
//        instructionStepHealth.text = "For eachquestion, select the number of days that you performed that activity."
//        steps += [instructionStepHealth]
//
//
//
//
//
//
//
//        //Diet
//        for i in 1...questions.questionSetThree.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet3-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetThree["\(i)"], answer: answerFormatSelection)
//            steps += [questionStep]
//        }
//
//        //Physical Activity
//        for i in 1...questions.questionSetFour.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet4-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetFour["\(i)"], answer: answerFormatSelection)
//            steps += [questionStep]
//        }
//
//        //Smoking
//        for i in 1...questions.questionSetFive.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet5-\(i)", title: "How many of the past 7 days did you:", text: questions.questionSetFive["\(i)"], answer: answerFormatSelection)
//            steps += [questionStep]
//        }
//
//
//        let instructionStepWeightManagement = ORKInstructionStep(identifier: "weightIntro")
//        instructionStepWeightManagement.title = "Weight Management"
//        instructionStepWeightManagement.text = "The following questions ask about your efforts to manage your weight during the last 30 days. If you were sick during the past month, please think back to the previous month that you were not sick. Circle the one answer that best describes what you do to lose weight or maintain your weight."
//        steps += [instructionStepWeightManagement]
//
//        //Weight Management
//        for i in 1...questions.questionSetSix.count{
//            let questionStep = ORKQuestionStep(identifier: "questionSet6-\(i)", title:questions.questionSetSix["\(i)"], answer: answerFormatAgreeDisagree)
//            steps += [questionStep]
//        }
//
//        //Alcohol Consumption
//
//        let instructionStepAlcoholManagement = ORKInstructionStep(identifier: "Alcohol Intro")
//        instructionStepAlcoholManagement.title = "The next three questions are about alcohol consumption."
//        instructionStepAlcoholManagement.text = "A drink of alcohol is defined as:\nOne, 12 oz. can or bottle of beer;\nOne, 4 ounce glass of wine;\nOne, 12 oz. can or bottle of wine cooler; \nOne mixed drink or cocktail;\nOr 1 shot of hard liquor."
//        steps += [instructionStepAlcoholManagement]
//
//        for i in 1...questions.questionSetSeven.count{
//            if i == 1{
//                let questionStep = ORKQuestionStep(identifier: "questionSet7-\(i)", title:questions.questionSetSeven["\(i)"], answer: answerFormatSelection)
//                steps += [questionStep]
//
//            }else{
//                let questionStep = ORKQuestionStep(identifier: "questionSet7-\(i)", title:questions.questionSetSeven["\(i)"], answer: answerFormatTextInput)
//                steps += [questionStep]
//            }
//
//
//        }
//
//
//        // TODO: Add Third type of questions
//
//        let completionStep = ORKCompletionStep(identifier: "SummaryStep")
//        completionStep.title = "Thank you for your time!"
//        completionStep.text = "Your participation is very important to us."
//        steps += [completionStep]
//        orderedTask = ORKNavigableOrderedTask(identifier: "survey1", steps: steps)
//
//
//        // PRAGMA MARK: Set rules for ORKNavigableOrdered Task
//        var predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "questionSet1-1"), expectedAnswer: true)
//        let ruleOne = ORKPredicateStepNavigationRule(resultPredicates: [predicate], destinationStepIdentifiers: ["questionSet1-2"], defaultStepIdentifier: "medicationIntro", validateArrays: true)
//
//        predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: "questionSet1-2"), expectedAnswer: true)
//        let ruleTwo = ORKPredicateStepNavigationRule(resultPredicates: [predicate], destinationStepIdentifiers: ["questionSet2-1"], defaultStepIdentifier: "medicationIntro", validateArrays: true)
//
//        orderedTask?.setNavigationRule(ruleOne, forTriggerStepIdentifier: "questionSet1-1")
//        orderedTask?.setNavigationRule(ruleTwo, forTriggerStepIdentifier: "questionSet1-2")
//
//        return orderedTask!
//    }
    
    
    func getOrderedTasksWithRulesWith(surveyID:String, stepsResponse:[Steps]) -> ORKNavigableOrderedTask {
        
        //some initializing code here
        
        //Creating steps
        for step in stepsResponse{
            switch step.type{
            case "Instruction":
                print("Show instruction Page")
                let instructionStepWeightManagement = ORKInstructionStep(identifier: step.id!)
                instructionStepWeightManagement.title = step.title
                instructionStepWeightManagement.text = step.message
                steps += [instructionStepWeightManagement]
                
            case "Question":
                
                switch step.answerFormat!{
                case "Boolean":
                    print("Boolean question")
                    let answerFormatYesOrNo = ORKBooleanAnswerFormat()
                    let questionStep = ORKQuestionStep(identifier: step.id!, title: step.title, answer: answerFormatYesOrNo)
                    steps += [questionStep]
                    
                case "Scale":
                    print("Scale question")
                    let answerFormatScale = ORKScaleAnswerFormat(maximumValue: (step.answerOptions?.count)!, minimumValue: 1, defaultValue: 1, step: 1)
                    let questionStep = ORKQuestionStep(identifier: step.id!, title: step.title, text: step.message, answer: answerFormatScale)
                    steps += [questionStep]
                    
                case "Selection":
                    print("Selection question")
                    var textChoices:[ORKTextChoice] = []
                    for (index,answerOption) in (step.answerOptions?.enumerated())!{
                        let orkTextChoice = ORKTextChoice(text: answerOption, detailText: nil, value: index+1 as NSCoding & NSCopying & NSObjectProtocol, exclusive: false)
                        textChoices.append(orkTextChoice)
                    }
                    let answerFormatSelection = ORKTextScaleAnswerFormat(textChoices: textChoices, defaultIndex: 2)
                    let questionStep = ORKQuestionStep(identifier: step.id!, title:step.title, answer: answerFormatSelection)
                    steps += [questionStep]
                    
                    
                case "Text":
                    let answerFormatSelection = ORKTextAnswerFormat()
                    let questionStep = ORKQuestionStep(identifier: step.id!, title: step.title, answer: answerFormatSelection)
                    steps += [questionStep]
                    
                default:
                    print("Something went wrong")
                }
                
                
           
            default:
                print("Default case executed")
            }
            
        }
        
        //Adding Completion Step
        let completionStep = ORKCompletionStep(identifier: "SummaryStep")
        completionStep.title = "Thank you for your time!"
        completionStep.text = "Your participation is very important to us."
        steps += [completionStep]
        
        //Finalizing steps
        orderedTask = ORKNavigableOrderedTask(identifier: surveyID, steps: steps)
        
        // Applying rules
        for (stepIndex,step) in stepsResponse.enumerated(){
            if step.rulesApplicable == true{
                let questionID = step.id!
                switch step.answerFormat!{
                case "Boolean":
                    var predicateArray:[NSPredicate] = []
                    var destinationArray:[String] = []
                    for (index,answerOption) in (step.answerOptions?.enumerated())!{
                        let predicate = ORKResultPredicate.predicateForBooleanQuestionResult(with: ORKResultSelector(resultIdentifier: questionID), expectedAnswer: index == 0)
                        predicateArray.append(predicate)
                        let destinationStepIndex = Int(step.rules![index])
                        let destinationStep = steps[destinationStepIndex!]
                        let destinationID = destinationStep.identifier
                        destinationArray.append(destinationID)
                    }
                    
                    let defaultNextStep = steps[stepIndex + 1]
                    let defaultNextStepID = defaultNextStep.identifier
                    let rule = ORKPredicateStepNavigationRule(resultPredicates: predicateArray, destinationStepIdentifiers:destinationArray, defaultStepIdentifier: defaultNextStepID, validateArrays: true)
                    orderedTask?.setNavigationRule(rule, forTriggerStepIdentifier: questionID)
                    
//                case "Scale":
//
//                case "Selection":
//
//                case "Text":
                   
                default:
                    print("Something went wrong")
                }
            }
        }
        
        
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

