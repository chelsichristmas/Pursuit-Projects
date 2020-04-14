//
//  AnswerQuestionController.swift
//  LabQuestions
//
//  Created by Chelsi Christmas on 12/16/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnswerQuestionController: UIViewController {
    
    var question: Question?
    
    @IBOutlet weak var answerTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // every view controller has a dismiss function on it
        dismiss(animated: true)
    }
    
    @IBAction func postAnswer(_ sender: UIBarButtonItem) {
        
        sender.isEnabled = false
        guard let answerText = answerTextView.text,
            !answerText.isEmpty,
            let question = question else {
                showAlert(title: "Missing Fields", message: "Answer is required, fellow is waiting...")
                return
        }
        // create a PostedAnswer instance
        let postedAnswer = PostedAnswer(questionTitle: question.title, questionId: question.id, questionLabName: question.labName, answerDescription: answerText, createdAt: String.getISOTimestamp())
        
        
        LabQuestionsAPIClient.postAnswer(postedAnswer: postedAnswer) { [weak self, weak sender] result in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                self?.showAlert(title: "Failed to Post Answer", message: "\(appError)")
                    sender?.isEnabled = true
            }
            case .success:
                DispatchQueue.main.async {
                self?.showAlert(title: "Answer Posted", message: "Thanks for submitting an answer", completion: { alert in
                    self?.dismiss(animated: true)
                    
                    }
                
                    
                )}
            
        }
        
        
    }
}
}
