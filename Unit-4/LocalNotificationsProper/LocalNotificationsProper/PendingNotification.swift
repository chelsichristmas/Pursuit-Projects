//
//  PendingNotification.swift
//  LocalNotificationsProper
//
//  Created by Chelsi Christmas on 2/20/20.
//  Copyright © 2020 Chelsi Christmas. All rights reserved.
//

import Foundation
import UserNotifications


class PendingNotification {
    
    // we wrote in a class becuase you don't wanna write it everywhere in th eapp. In this case you can query this one lcalss for the function we've created 
    public func getPendingNotifications(completion: @escaping ([UNNotificationRequest]) -> ()) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (requests)
            in
            print("There are \(requests.count) pending requests")
            completion(requests)
        }
    }
}
