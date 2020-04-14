//
//  AnswersViewController.swift
//  LabQuestions
//
//  Created by Chelsi Christmas on 12/16/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnswersViewController: UIViewController {
    
    var answers = [Answer]() {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    var question: Question?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        fetchAnswers()
    }
    
    func fetchAnswers() {
        LabQuestionsAPIClient.fetchAnswers(question: question { [weak self] (result) in
            switch result {
            case .failure(let appError):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Failed fetchign answers", message: "\(appError)")
                }
            case .success(let answers):
                self?.answers = answers.filer { $0.questionId == question.id}
            }
        }
    }
    

        
}

extension AnswersViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    answers.count
}
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath)
    let answer = answers[indexPath.row]
    cell.textLabel?.text = answer.answerDescription
    cell.textLabel?.numberOfLines = 0
    
    return cell
}
}
