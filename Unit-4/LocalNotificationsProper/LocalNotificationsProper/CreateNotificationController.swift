//
//  CreateNotificationController.swift
//  LocalNotificationsProper
//
//  Created by Chelsi Christmas on 2/20/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import UIKit

protocol CreateNotificationControllerDelegate: AnyObject {
    func didCreateNotification(_ createNotificationController: CreateNotificationController)
}

class CreateNotificationController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: CreateNotificationControllerDelegate?
    // timeInterval = seconds
    // Standardized time came about in 1970
    private var timeInterval: TimeInterval = Date().timeIntervalSinceNow + 5 // current time plus 5
    // in case the user doesn't chnage the dtae picker but tries to make a notification ( it will give a default value for the date )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func createLocalNotification () {
        // to create a notification you need content, identifier, triggers
        
        // step 1: Create the content
        let content = UNMutableNotificationContent()
        // This refers to the properties of the Notification that are mutable/editable
        content.title = titleTextField.text ?? "No title"
        content.body = "Local Notifications is awesome when used appropriately"
        content.subtitle = "Learning Local Notifications"
        
        //TODO: you can also import your own sound file
        content.sound = .default // if the app only works in the background and the app is not on silent - please test on device
//        content.sound = UNNotificationSound(named: UNNotificationSound(rawValue: "file.mp3"))
        
        // TODO: userInfo dictionary can hold additional data
        //content.userinfor = [" "]
        
        // create identifier
        let identifier = UUID().uuidString // unique string
        
        // if you wanrt to call on one Notification you can give the identifier a specific value
        // attachment
        // This image was added directly to the project and no to th eassets folder
        if let imageURL = Bundle.main.url(forResource: "tesla", withExtension: "JPG") {
            
            // UNNotificationAttachment throws so it requires a catch
            do {
                let attachment  = try UNNotificationAttachment(identifier: identifier, url: imageURL, options: nil)
                //contents take an array of attchaments, and in this case we only have one attachment
                content.attachments = [attachment]
            } catch {
                print("Error with attachment: \(error)")
            }
        } else {
            print("image resources could not be found")
        }
        
        // create trigger
        // 3 possible triggers for local notifications: time interval, calendar, location
        // Ways to send a a notification repeatedly/ everytime a specific event happens
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        // create a request
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        // add request to the UnNotificationCenter
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("error adding request: \(error)")
            } else  {
                print ("request was successfully added")
            }
        }
    }
    @IBAction func datePickerChanged(_ sender: UIDatePicker){
        // to avoid time being in the past
        guard sender.date > Date() else { return }
        // timeIntervalSinceNow creates a time stamp at the exact date
        timeInterval = sender.date.timeIntervalSinceNow
    }
    
  
    
    
    
}
