//
//  CreateUsersViewController.swift
//  number-Facts
//
//  Created by Chelsi Christmas on 4/8/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

protocol CreateUserDelegate: AnyObject {
    func didCreateUser(_ createUserViewController: CreateUsersViewController, user: User)
}
class CreateUsersViewController: UITableViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker
    
    weak var delegate: CreateUserDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        datePicker.maximumDate = Date()
    }
    
//date pickers require a targeted action rather than a data source/delegate
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        guard let userNameText = usernameTextField.text,
            !usernameTextField.isEmpty else {
                print("missing user name")
                return
        }
        let date = datePicker.date
        
        // create a user
        let user = CoreDataManager.shared.createUser(name: userNameText, dob: date)
        
        // set delegate method
        delegate?.didCreateUser(self, user: user)
        
        dismiss(animated: true)
    }
    
    // USerViewCOntroller will now have access to the created user and get a delegation notification about the new user
    
    
}

// manges the post model and inherits from NSMangeObject
  // Anything that inherits this classData Ready

  // code in here, we do not want to regenerate
      // we don't want to override custom code in this class
      // we can access properties from the extension on post here
      // don't write code (in the properties page)
      // when you're ready to override, you'll delete the files
