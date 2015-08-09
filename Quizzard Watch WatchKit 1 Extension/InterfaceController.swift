//
//  InterfaceController.swift
//  Quizzard Watch WatchKit 1 Extension
//
//  Created by Alex Lima Lopes Cancado on 7/08/15.
//  Copyright © 2015 Alex Lima Lopes Cancado. All rights reserved.
//

import WatchKit
import Foundation


// this is where we will hold our data structure
struct QuizTemplate {
    
    var Question = String()
    var Answer = Int()
    var Answers = [String]()
    
}

class InterfaceController: WKInterfaceController {

    @IBOutlet var QuestionLabel: WKInterfaceLabel!
    @IBOutlet var Button1: WKInterfaceButton!
    @IBOutlet var Button2: WKInterfaceButton!
    @IBOutlet var Button3: WKInterfaceButton!
    @IBOutlet var Button4: WKInterfaceButton!
    
    
    // create a new obj based on the quiztemplate and put it in an array so we can pick one question randomly
    var quizObject = [QuizTemplate]()
    
    var numberPicked = Int()
    
    var randomNumber = Int()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)

        //QuizTemplate(Question: "Are you...", Answer: 2, Answers: ["Annoying","Boring","Awesome","Blah"]),
        //QuizTemplate(Question: "How Are You Today?", Answer: 1, Answers: ["Not Bad","Great","Miserable","Sleepy"])

        quizObject = [
            QuizTemplate(Question: "How many planets are there in the Solar System?", Answer: 3, Answers: ["7","10","9","8"]),
            QuizTemplate(Question: "What is the smallest planet in the Solar System?", Answer: 1, Answers: ["Venus","Mercury","Jupiter","Mars"]),
            QuizTemplate(Question: "What is the largest planet in the Solar System?", Answer: 2, Answers: ["Earth","Mars","Jupiter","Uranus"]),
            QuizTemplate(Question: "What is the hottest planet in the Solar System?", Answer: 3, Answers: ["Saturn","Neptune","Mars","Venus"]),
            QuizTemplate(Question: "What is the name of the planet with extensive rings?", Answer: 2, Answers: ["Mercury","Venus","Saturn","Jupiter"]),
            QuizTemplate(Question: "The chemical element uranium was named after what planet?", Answer: 2, Answers: ["Saturn","Mercury","Uranus","Jupiter"]),
            QuizTemplate(Question: "What planet in the solar system is farthest from the Sun?", Answer: 1, Answers: ["Venus","Neptune","Mars","Saturn"]),
            QuizTemplate(Question: "What is the second smallest planet in the solar system?", Answer: 1, Answers: ["Jupter","Mars","Uranus","Saturn"]),
            QuizTemplate(Question: "What planet is closest in size to Earth?", Answer: 3, Answers: ["Mars","Mercury","Neptune","Venus"]),
            QuizTemplate(Question: "The moon Titan orbits what planet?", Answer: 2, Answers: ["Jupiter","Venus","Saturn","Uranus"]),
            QuizTemplate(Question: "What planet is nicknamed the ‘Red Planet’?", Answer: 2, Answers: ["Earth","Venus","Mars","Mercury"]),
            QuizTemplate(Question: "What planet is larger than Saturn?", Answer: 3, Answers: ["Earth","Mars","Neptune","Jupiter"]),
            QuizTemplate(Question: "The Galilean moons orbit what planet?", Answer: 0, Answers: ["Jupiter","Saturn","Uranus","Neptune"]),
            QuizTemplate(Question: "What planet is closest to the Sun?", Answer: 0, Answers: ["Mercury","Venus","Earth","Mars"]),
            QuizTemplate(Question: "What is the seventh planet from the Sun?", Answer: 3, Answers: ["Uranus","Saturn","Neptune","Uranus"]),
            QuizTemplate(Question: "Pluto is a: ", Answer: 3, Answers: ["Planet","Asteroid","Moon","Dwarf Planet"]),
            QuizTemplate(Question: "Triton is the largest moon of what planet?", Answer: 0, Answers: ["Neptune","Jupiter","Saturn","Uranus"]),
            QuizTemplate(Question: "What is the brightest planet in the night sky?", Answer: 3, Answers: ["Jupiter","Mars","Mercury","Venus"]),
            QuizTemplate(Question: "What is the third planet from the Sun?", Answer: 1, Answers: ["Mars","Earth","Mercury","Venus"]),
            QuizTemplate(Question: "Phobos and Deimos are moons of what planet?", Answer: 1, Answers: ["Mercury","Mars","Saturn","Uranus"])]
        
        
        PickQuestion()
        
    }
    
    
    // now we are going to pick one question randomly
    func PickQuestion(){
    
        randomNumber = random() % quizObject.count
        
        
        
        QuestionLabel.setText(quizObject[randomNumber].Question)
        
        Button1.setTitle(quizObject[randomNumber].Answers[0])
        Button2.setTitle(quizObject[randomNumber].Answers[1])
        Button3.setTitle(quizObject[randomNumber].Answers[2])
        Button4.setTitle(quizObject[randomNumber].Answers[3])
        
        
    
    }
    
    
    func CheckAnswer(){
        
        
    
        if ( numberPicked == quizObject[randomNumber].Answer ){
        
            QuestionLabel.setTextColor(UIColor.whiteColor())
            
            PickQuestion()
            
        }
        
        else {
        
            QuestionLabel.setTextColor(UIColor.redColor())
            
        }
    
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func Button1Action() {
        
        numberPicked = 0
        
        CheckAnswer()
        
    }
    @IBAction func Button2Action() {
        
        numberPicked = 1
        
        CheckAnswer()
        
    }
    @IBAction func Button3Action() {
        
        numberPicked = 2
        
        CheckAnswer()
        
    }

    @IBAction func Button4Action() {
        
        numberPicked = 3
        
        CheckAnswer()
        
    }
    
    
}
