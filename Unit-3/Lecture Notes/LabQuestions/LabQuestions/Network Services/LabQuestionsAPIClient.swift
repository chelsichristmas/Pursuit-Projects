//
//  LabQuestionsAPIClient.swift
//  LabQuestions
//
//  Created by Chelsi Christmas on 12/12/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct LabQuestionsAPIClient {
    
    static func fetchQuestions(completion: @escaping (Result<[Question], AppError>) -> ()) {
        
        let labEndpointURLString = "https://5df04c1302b2d90014e1bd66.mockapi.io/questions"
        
        // create a URL from the endpoint string
        guard let url = URL(string: labEndpointURLString) else {
            completion(.failure(.badURL(labEndpointURLString)))
            return
        }
        
        // make a URLRequest object to pass to the NetworkHelper
        let request = URLRequest(url: url)
        
        // set the method, e.g GET, POST, DELETE, PUT, UPDATE...
        // request.httpMethod = "POST"
        // request.httpBody = data
        // json, html, etc. are Multimedia types
        //the request below is required when posting so we inform the POST request of the data type
        // if we do not provide the header value as "application/json"
        // we will get a decoding error when attempting to decode the JSON
        // request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                // construct our [Question] array
                do {
                    
                    //JSONDecoder() - used to convert web data to  Swift models
                    //JSONEncoder() - used to convert Swift model to data
                    let questions = try JSONDecoder().decode([Question].self, from: data)
                    completion(.success(questions))
                    
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func postQuestion(question: PostedQuestion,  completion: @escaping (Result<Bool,AppError>) -> ()) {
    
        let endpointURLString = "https://5df04c1302b2d90014e1bd66.mockapi.io/questions"
        
        // create a url
        guard let url = URL(string: endpointURLString) else {
            completion(.failure(.badURL(endpointURLString)))
            return
        }
        
        //convert PostedQuestion to Data
        do {
            let data = try JSONEncoder().encode(question)
            
            //configure our URLRequest
            // url
            var request = URLRequest(url: url)
            // type of http method
            request.httpMethod = "POST"
            //type of data
            // set Value overrides all the other lanuages
            // addValue appends a language
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            //provide data beign sent to web api
            request.httpBody = data
            
            //execute post request
            NetworkHelper.shared.performDataTask(with: request) {(result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
        } catch {
            completion(.failure(.encodingError(error)))
            
        }
    }
    
    //POST request to send an answer to the Web API
    static func postAnswer(postedAnswer: PostedAnswer, completion: @escaping (Result<Bool,AppError>) -> ()) {
        
        
        
        let answerEndpointURLString =  "https://5df04c1302b2d90014e1bd66.mockapi.io/answers"
        
        guard let url = URL(string: answerEndpointURLString) else {
            return
        }
        
        // Step 1. convert your swift model (e.g postedAnswer) to Data w ewill use JSONEncoder() to convert postedAnswer to Data
         do {
            
            let data = try JSONEncoder().encode(postedAnswer)
            
            // Step 2. create a mutable URLRequest and assign it the endpoint URL
            var request = URLRequest(url: url)
            
            // Step 3. let wenb API know the type of data being sent
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Step 4. use httpBody on request to add the data created from the  postAnswer model ,this is the data we are sending ot the Web API, this is similar to thte Postmasn body code snippet below:
            /*
             {
                 "description": "When I run my app there isn't any data being loaded into my table view",
                 "title": "Can't get data in my table view - Chelsi C.",
                 "labName": "Comic Lab"
             }
             
             // we are not sending an id or createdAt coding key with this because it is created when we make the post
             */
            
            request.httpBody = data
            
            // Step 5. clarify the http method we are using since by default URLSession.dataTask does GET request, here we are making a POST request
            request.httpMethod = "POST" // (GET, POST) others include PUT, DELETE, UPDATE...
            
            // now we will use NetworkHelper (URLSession wrapper class) to make the network POST request
            
            NetworkHelper.shared.performDataTask(with: request) { (result) in
                switch result {
                case .failure(let appError):
                    completion(.failure(.networkClientError(appError)))
                case .success:
                    completion(.success(true))
                }
            }
            
            } catch {
                completion(.failure(.encodingError(error)))
    }
    // Steps in making a POST request
    
    // Step 1: Convert your Swift model (e.g Posted Answer) to Data
   
    
    }
    
    static func fetchAnswers(question: Question, completion: @escaping (Result<[Answer], AppError>) -> ()) {
        
        let answersURLString = "https://5df04c1302b2d90014e1bd66.mockapi.io/answers"
        
        guard let url = URL(string: answersURLString) else {
            completion(.failure(.badURL(answersURLString)))
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                let answers = try JSONDecoder().decode([Answer].self, from: data)
                completion(.success(answers))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
    }
}
